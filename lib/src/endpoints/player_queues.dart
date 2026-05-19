import '../client.dart';
import '../events.dart';
import '../models/player_queue.dart';

/// PlayerQueue related endpoints/data for Music Assistant.
class PlayerQueuesEndpoint {
  final MusicAssistantClient _client;
  final Map<String, PlayerQueue> _queues = {};

  /// Create a PlayerQueuesEndpoint instance
  PlayerQueuesEndpoint(this._client) {
    // Subscribe to player queue events.
    _client.subscribe(_onEvent, eventTypes: {EventType.queueAdded, EventType.queueUpdated});
  }

  /// Get a view of all player queues.
  Map<String, PlayerQueue> get all => Map.unmodifiable(_queues);

  // TODO: Endpoints

  /// Fetch initial state once the server is connected.
  Future<void> fetchState() async {
    for (final queue in await _getPlayerQueues()) {
      _queues[queue.queueId!] = queue;
    }
  }

  // Fetch all PlayerQueues from the server.
  Future<List<PlayerQueue>> _getPlayerQueues() async {
    final result = await _client.sendCommand('player_queues/all') as List<dynamic>;
    return result.map((item) => PlayerQueue.fromJson(item as Map<String, dynamic>)).toList();
  }

  // Handle incoming player event.
  void _onEvent(MusicAssistantEvent event) {
    switch (event.type) {
      case EventType.queueAdded || EventType.queueUpdated:
        assert(event.objectId != null);
        _queues[event.objectId!] = PlayerQueue.fromJson(event.data!);

      default:
        break;
    }
  }
}
