import 'dart:async';
import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'exceptions.dart';

/// Extract Websocket URL from (base) Music Assistant URL.
String getWebSocketUrl(String url) {
  if (url.isEmpty || !url.contains('://')) {
    throw ArgumentError('$url is not a valid url');
  }
  var wsUrl = url.replaceFirst('http', 'ws');
  if (!wsUrl.endsWith('/ws')) {
    wsUrl += '/ws';
  }
  return wsUrl.replaceAll('//ws', '/ws');
}

class MusicAssistantClient {
  final String serverUrl;
  final String token;

  WebSocketChannel? _channel;
  final Map<String, Completer<dynamic>> _pendingRequests = {};

  MusicAssistantClient({required this.serverUrl, required this.token});

  /// Connects to the Music Assistant WebSocket server and authenticates.
  Future<void> connect() async {
    // Connect to the WebSocket server
    _channel = WebSocketChannel.connect(Uri.parse(getWebSocketUrl(serverUrl)));
    await _channel!.ready;

    // Authenticate
    sendCommand('auth', args: {'token': token});
  }

  /// Disconnects from the server, completing any pending requests with an error.
  Future<void> disconnect() async {
    for (final completer in _pendingRequests.values) {
      completer.completeError(StateError('disconnected'));
    }
    _pendingRequests.clear();
    await _channel?.sink.close();
    _channel = null;
  }

  /// Sends a command to the server and returns the response.
  Future<dynamic> sendCommand(String command, {Map<String, dynamic>? args}) async {
    // Generate a unique message ID for this request
    final messageId = const Uuid().v4();

    // Create a completer for this request
    final completer = Completer<dynamic>();
    _pendingRequests[messageId] = completer;

    // Construct the message to send
    final message = <String, dynamic>{
      'message_id': messageId,
      'command': command,
      if (args != null) 'args': args,
    };

    // Encode the message as JSON and send it
    _channel!.sink.add(jsonEncode(message));

    // Wait for a response
    return completer.future;
  }

  /// Subscribes to server-pushed events, calling [callback] for each one.
  void subscribe(void Function(Map<String, dynamic>) callback) {
    // TODO
  }

  /// Starts listening for incoming messages, routing responses to pending requests.
  /// Runs until the connection is closed.
  Future<void> startListening() async {
    await for (final raw in _channel!.stream) {
      final data = jsonDecode(raw as String) as Map<String, dynamic>;
      print('[MA] received: $data');

      if (data.containsKey('event')) {
        // Handle server-pushed events
        _handleEvent(data);
      } else if (data.containsKey('error_code')) {
        // Handle error results
        final messageId = data['message_id'] as String?;
        if (messageId == null) return;

        // Complete the pending request with an error
        final errorCode = data['error_code'] as int? ?? 0;
        final details = data['details'] as String?;
        _pendingRequests.remove(messageId)?.completeError(musicAssistantExceptionFromErrorCode(errorCode, details));
      } else if (data.containsKey('result')) {
        // Handle success results
        final messageId = data['message_id'] as String?;
        if (messageId == null) return;

        // Complete the pending request with the result
        _pendingRequests.remove(messageId)?.complete(data['result']);
      } else {
        // TODO: Change to debug log
        // print('[MA] unknown message: $data');
      }
    }
  }

  _handleEvent(Map<String, dynamic> event) {
    // TODO
  }
}
