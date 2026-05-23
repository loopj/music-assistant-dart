import 'dart:async';

import 'package:logging/logging.dart';

import 'connection.dart';
import 'events.dart';
import 'endpoints/auth.dart';
import 'endpoints/players.dart';
import 'endpoints/player_queues.dart';
import 'models/api.dart';
import 'models/auth.dart';

final _logger = Logger('MusicAssistant');

/// Event subscription class, used to track callback and filters for each subscription
class _Subscription {
  final void Function(MusicAssistantEvent) callback;
  final Set<EventType>? eventTypes;
  final Set<String>? objectIds;

  const _Subscription(this.callback, {this.eventTypes, this.objectIds});
}

/// WebSocket client for Music Assistant servers.
class MusicAssistantClient {
  /// Base URL of the Music Assistant server (e.g. http://localhost:8095).
  final String serverUrl;

  /// Authentication token for the Music Assistant server.
  final String token;

  /// Auth related endpoints/commands.
  late final AuthEndpoint auth = AuthEndpoint(this);

  /// Player related endpoints/commands.
  late final PlayersEndpoint players = PlayersEndpoint(this);

  /// Player queue related endpoints/commands.
  late final PlayerQueuesEndpoint playerQueues = PlayerQueuesEndpoint(this);

  /// Server info received on connection.
  ServerInfoMessage? get serverInfo => _connection.serverInfo;

  /// Current user received on auth.
  User? get currentUser => _connection.currentUser;

  /// Stream of connection state changes.
  Stream<ConnectionState> get state => _connection.state;

  final Connection _connection;
  final List<_Subscription> _subscriptions = [];

  MusicAssistantClient({required this.serverUrl, required this.token})
    : _connection = Connection(serverUrl: serverUrl, token: token) {
    // Route server-pushed events to subscribers
    _connection.events.listen(_handleEvent);

    // Re-fetch state after reconnection
    _connection.state.listen((state) {
      if (state == ConnectionState.reconnected) unawaited(fetchState());
    });
  }

  /// Connects to the Music Assistant WebSocket server and authenticates.
  Future<void> connect() => _connection.open();

  /// Disconnects from the server.
  Future<void> disconnect() => _connection.close();

  /// Sends a command to the server and returns the response.
  Future<dynamic> sendCommand(String command, {Map<String, dynamic>? args}) =>
      _connection.sendCommand(command, args: args);

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

  /// Fetches initial state for endpoints
  Future<void> fetchState() async {
    await Future.wait([playerQueues.fetchState(), players.fetchState()]);
  }

  void _handleEvent(Map<String, dynamic> raw) {
    final event = MusicAssistantEvent(
      type: EventType.fromValue(raw['event'] as String? ?? ''),
      objectId: raw['object_id'] as String?,
      data: raw['data'],
    );

    _logger.fine('Received event: ${event.type} (object_id: ${event.objectId})');

    for (final sub in _subscriptions) {
      if (sub.eventTypes != null && !sub.eventTypes!.contains(event.type)) continue;
      if (sub.objectIds != null && !sub.objectIds!.contains(event.objectId)) continue;

      sub.callback(event);
    }
  }
}
