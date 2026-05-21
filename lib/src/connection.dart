import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'exceptions.dart';
import 'models/api.dart';

final _logger = Logger('music_assistant.Connection');

enum ConnectionState { connected, disconnected, reconnected }

/// Extract Websocket URL from (base) Music Assistant URL.
String _getWebSocketUrl(String url) {
  if (url.isEmpty || !url.contains('://')) {
    throw ArgumentError('$url is not a valid url');
  }
  var wsUrl = url.replaceFirst('http', 'ws');
  if (!wsUrl.endsWith('/ws')) {
    wsUrl += '/ws';
  }
  return wsUrl.replaceAll('//ws', '/ws');
}

/// Manages the WebSocket connection to a Music Assistant server, including
/// authentication, command dispatch, and automatic reconnection.
class Connection {
  static const int apiSchemaVersion = 28;
  static const int keepaliveInterval = 60;

  /// Base URL of the Music Assistant server (e.g. http://localhost:8095).
  final String serverUrl;

  /// Authentication token for the Music Assistant server.
  final String token;

  /// Server info received on connection.
  ServerInfoMessage? serverInfo;

  WebSocketChannel? _channel;
  Timer? _keepaliveTimer;
  bool _closing = false;
  final Map<String, Completer<dynamic>> _pendingRequests = {};
  final _stateController = StreamController<ConnectionState>.broadcast();
  final _eventsController = StreamController<Map<String, dynamic>>.broadcast();

  /// Stream of connection state changes.
  Stream<ConnectionState> get state => _stateController.stream;

  /// Stream of server-pushed events.
  Stream<Map<String, dynamic>> get events => _eventsController.stream;

  Connection({required this.serverUrl, required this.token});

  /// Connects to the Music Assistant WebSocket server and authenticates.
  Future<void> open() async {
    _closing = false;
    await _connect();
    _stateController.add(ConnectionState.connected);
  }

  /// Disconnects from the server, completing any pending requests with an error.
  Future<void> close() async {
    _closing = true;
    _keepaliveTimer?.cancel();
    _keepaliveTimer = null;
    _failPendingRequests();
    await _channel?.sink.close();
    _channel = null;
    _stateController.add(ConnectionState.disconnected);
  }

  /// Sends a command to the server and returns the response.
  Future<dynamic> sendCommand(String command, {Map<String, dynamic>? args}) async {
    // Generate a unique message ID for this request
    final messageId = const Uuid().v4();

    // Create a completer for this request
    final completer = Completer<dynamic>();
    _pendingRequests[messageId] = completer;

    // Construct the message to send
    final message = <String, dynamic>{'message_id': messageId, 'command': command, 'args': ?args};

    // Encode the message as JSON and send it
    _channel!.sink.add(jsonEncode(message));

    // Wait for a response
    return completer.future;
  }

  void _failPendingRequests() {
    for (final completer in _pendingRequests.values) {
      completer.completeError(StateError('disconnected'));
    }
    _pendingRequests.clear();
  }

  Future<void> _connect() async {
    // Connect to the WebSocket server
    _channel = WebSocketChannel.connect(Uri.parse(_getWebSocketUrl(serverUrl)));
    await _channel!.ready;

    // Set up a stream queue to process incoming messages sequentially
    final queue = StreamQueue(_channel!.stream);

    // The first message is always the server info
    final raw = await queue.next;
    serverInfo = ServerInfoMessage.fromJson(jsonDecode(raw as String) as Map<String, dynamic>);

    // Check for server schema version compatibility
    if (serverInfo!.minSupportedSchemaVersion > apiSchemaVersion) {
      throw InvalidServerVersion(
        'Schema version is incompatible: ${serverInfo!.schemaVersion}, '
        'the server requires at least ${serverInfo!.minSupportedSchemaVersion} '
        '- update the Music Assistant client to a more recent version or downgrade the server.',
      );
    }

    // Connected successfully
    _logger.info(
      'Connected to Music Assistant server: ${serverInfo!.serverId}, '
      'Version ${serverInfo!.serverVersion}, '
      'Schema Version ${serverInfo!.schemaVersion}',
    );

    // Start processing incoming messages
    unawaited(_messageLoop(queue));

    // Authenticate
    await _authenticate();

    // Start the keepalive timer
    _keepaliveTimer?.cancel();
    _keepaliveTimer = Timer.periodic(const Duration(seconds: keepaliveInterval), (_) {
      _channel?.sink.add(jsonEncode({'message_id': 'keepalive', 'command': 'info'}));
    });
  }

  Future<void> _authenticate() async {
    try {
      final result = await sendCommand('auth', args: {'token': token});
      if (result == null || result == false) {
        throw const AuthenticationFailedException();
      }
    } on AuthenticationFailedException {
      rethrow;
    } catch (e) {
      throw AuthenticationFailedException('Authentication failed: $e');
    }
  }

  Future<void> _messageLoop(StreamQueue<dynamic> queue) async {
    try {
      while (await queue.hasNext) {
        final data = jsonDecode(await queue.next as String) as Map<String, dynamic>;

        if (data.containsKey('event')) {
          // Handle server-pushed events
          _eventsController.add(data);
        } else if (data.containsKey('error_code')) {
          // Handle error results
          final messageId = data['message_id'] as String?;
          if (messageId == null) continue;

          // Complete the pending request with an error
          final errorCode = data['error_code'] as int? ?? 0;
          final details = data['details'] as String?;
          _pendingRequests.remove(messageId)?.completeError(musicAssistantExceptionFromErrorCode(errorCode, details));
        } else if (data.containsKey('result')) {
          // Handle success results
          final messageId = data['message_id'] as String?;
          if (messageId == null) continue;

          // Complete the pending request with the result
          _pendingRequests.remove(messageId)?.complete(data['result']);
        } else {
          _logger.fine('Unknown message: $data');
        }
      }
    } catch (e) {
      _logger.warning('Connection error: $e');
    }

    // Intentional close - nothing to do
    if (_closing) return;

    _logger.warning('Lost connection to Music Assistant server');

    // Stop the keepalive timer
    _keepaliveTimer?.cancel();
    _keepaliveTimer = null;

    // Fail any pending requests so callers don't hang
    _failPendingRequests();

    // Notify listeners and begin reconnecting
    _stateController.add(ConnectionState.disconnected);
    unawaited(_reconnectLoop());
  }

  Future<void> _reconnectLoop() async {
    var attempt = 0;
    while (!_closing) {
      attempt++;

      // Back off before each attempt: min(2 * attempt, 600) seconds
      await Future.delayed(Duration(seconds: (2 * attempt).clamp(0, 600)));
      if (_closing) break;

      try {
        await _connect();
        _stateController.add(ConnectionState.reconnected);
        return;
      } catch (e) {
        _logger.warning('Reconnect attempt $attempt failed: $e');
      }
    }
  }
}
