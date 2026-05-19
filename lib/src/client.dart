import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'events.dart';
import 'exceptions.dart';

import 'endpoints/players.dart';
import 'endpoints/player_queues.dart';

final _logger = Logger('MusicAssistantClient');

// Event subscription class, used to track callback and filters for each subscription
class _Subscription {
  final void Function(MusicAssistantEvent) callback;
  final Set<EventType>? eventTypes;
  final Set<String>? objectIds;

  const _Subscription(this.callback, {this.eventTypes, this.objectIds});
}

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

class MusicAssistantClient {
  final String serverUrl;
  final String token;

  WebSocketChannel? _channel;
  final Map<String, Completer<dynamic>> _pendingRequests = {};
  final List<_Subscription> _subscriptions = [];

  MusicAssistantClient({required this.serverUrl, required this.token});

  /// Endpoints
  late final PlayersEndpoint players = PlayersEndpoint(this);
  late final PlayerQueuesEndpoint playerQueues = PlayerQueuesEndpoint(this);

  /// Connects to the Music Assistant WebSocket server and authenticates.
  Future<void> connect() async {
    // Connect to the WebSocket server
    _channel = WebSocketChannel.connect(Uri.parse(_getWebSocketUrl(serverUrl)));
    await _channel!.ready;

    // Authenticate
    // TODO: Throw appropriate exceptions on failure
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
    final message = <String, dynamic>{'message_id': messageId, 'command': command, if (args != null) 'args': args};

    // Encode the message as JSON and send it
    _channel!.sink.add(jsonEncode(message));

    // Wait for a response
    return completer.future;
  }

  /// Subscribes to server-pushed events, calling [callback] for each one.
  /// Optionally filter by [eventType] and/or [objectId].
  /// Returns a function that cancels the subscription when called.
  void Function() subscribe(
    void Function(MusicAssistantEvent) callback, {
    Set<EventType>? eventTypes,
    Set<String>? objectIds,
  }) {
    // Create a filtered subscription object
    final sub = _Subscription(callback, eventTypes: eventTypes, objectIds: objectIds);

    // Add the subscription to the list
    _subscriptions.add(sub);

    // Return a function to cancel the subscription
    return () => _subscriptions.remove(sub);
  }

  /// Starts listening for incoming messages, routing responses to pending requests.
  Future<void> startListening() async {
    await for (final raw in _channel!.stream) {
      // Decode the incoming message
      final data = jsonDecode(raw as String) as Map<String, dynamic>;

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
        _logger.fine('Unknown message: $data');
      }
    }
  }

  void _handleEvent(Map<String, dynamic> raw) {
    final event = MusicAssistantEvent(
      type: EventType.fromValue(raw['event'] as String? ?? ''),
      objectId: raw['object_id'] as String?,
      data: raw['data'] as Map<String, dynamic>?,
    );

    _logger.fine('Received event: ${event.type} (object_id: ${event.objectId})');

    for (final sub in _subscriptions) {
      if (sub.eventTypes != null && !sub.eventTypes!.contains(event.type)) continue;
      if (sub.objectIds != null && !sub.objectIds!.contains(event.objectId)) continue;

      sub.callback(event);
    }
  }
}
