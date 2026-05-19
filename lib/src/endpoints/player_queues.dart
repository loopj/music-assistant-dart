import '../client.dart';
import '../events.dart';
import '../models/enums.dart';
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

  /// Return a single PlayerQueue by queue_id.
  PlayerQueue? get(String queueId) => _queues[queueId];

  /// Return the current active/synced queue for a player.
  Future<PlayerQueue?> getActiveQueue(String playerId) async {
    final result = await _client.sendCommand('player_queues/get_active_queue', args: {'player_id': playerId});
    if (result == null) return null;
    return PlayerQueue.fromJson(result as Map<String, dynamic>);
  }

  /// Send PLAY command to given queue.
  Future<void> play(String queueId) async {
    await _client.sendCommand('player_queues/play', args: {'queue_id': queueId});
  }

  /// Send PAUSE command to given queue.
  Future<void> pause(String queueId) async {
    await _client.sendCommand('player_queues/pause', args: {'queue_id': queueId});
  }

  /// Send STOP command to given queue.
  Future<void> stop(String queueId) async {
    await _client.sendCommand('player_queues/stop', args: {'queue_id': queueId});
  }

  /// Toggle play/pause on given playerqueue.
  Future<void> playPause(String queueId) async {
    await _client.sendCommand('player_queues/play_pause', args: {'queue_id': queueId});
  }

  /// Handle RESUME command for given queue.
  Future<void> resume(String queueId, {bool? fadeIn}) async {
    await _client.sendCommand('player_queues/resume', args: {'queue_id': queueId, 'fade_in': fadeIn});
  }

  /// Send NEXT TRACK command to given queue.
  Future<void> next(String queueId) async {
    await _client.sendCommand('player_queues/next', args: {'queue_id': queueId});
  }

  /// Send PREVIOUS TRACK command to given queue.
  Future<void> previous(String queueId) async {
    await _client.sendCommand('player_queues/previous', args: {'queue_id': queueId});
  }

  /// Send CLEAR QUEUE command to given queue.
  Future<void> clear(String queueId) async {
    await _client.sendCommand('player_queues/clear', args: {'queue_id': queueId});
  }

  /// Move queue item x up/down the queue.
  Future<void> moveItem(String queueId, String queueItemId, {int posShift = 1}) async {
    await _client.sendCommand(
      'player_queues/move_item',
      args: {'queue_id': queueId, 'queue_item_id': queueItemId, 'pos_shift': posShift},
    );
  }

  /// Move given queue item one place up in the queue.
  Future<void> moveUp(String queueId, String queueItemId) async {
    await moveItem(queueId, queueItemId, posShift: -1);
  }

  /// Move given queue item one place down in the queue.
  Future<void> moveDown(String queueId, String queueItemId) async {
    await moveItem(queueId, queueItemId, posShift: 1);
  }

  /// Move given queue item as next up in the queue.
  Future<void> moveNext(String queueId, String queueItemId) async {
    await moveItem(queueId, queueItemId, posShift: 0);
  }

  /// Delete item (by id or index) from the queue.
  Future<void> deleteItem(String queueId, dynamic itemIdOrIndex) async {
    await _client.sendCommand(
      'player_queues/delete_item',
      args: {'queue_id': queueId, 'item_id_or_index': itemIdOrIndex},
    );
  }

  /// Handle SEEK command for given queue.
  Future<void> seek(String queueId, int position) async {
    await _client.sendCommand('player_queues/seek', args: {'queue_id': queueId, 'position': position});
  }

  /// Handle SKIP command for given queue.
  Future<void> skip(String queueId, int seconds) async {
    await _client.sendCommand('player_queues/skip', args: {'queue_id': queueId, 'seconds': seconds});
  }

  /// Configure shuffle mode on the queue.
  Future<void> shuffle(String queueId, bool shuffleEnabled) async {
    await _client.sendCommand('player_queues/shuffle', args: {'queue_id': queueId, 'shuffle_enabled': shuffleEnabled});
  }

  /// Configure repeat mode on the queue.
  Future<void> repeat(String queueId, RepeatMode repeatMode) async {
    await _client.sendCommand('player_queues/repeat', args: {'queue_id': queueId, 'repeat_mode': repeatMode.value});
  }

  /// Play item at index (or item_id) X in queue.
  Future<void> playIndex(String queueId, dynamic index, {int seekPosition = 0, bool fadeIn = false}) async {
    await _client.sendCommand(
      'player_queues/play_index',
      args: {'queue_id': queueId, 'index': index, 'seek_position': seekPosition, 'fade_in': fadeIn},
    );
  }

  /// Play media item(s) on the given queue.
  Future<void> playMedia(
    String queueId,
    dynamic media, {
    QueueOption? option,
    bool radioMode = false,
    String? startItem,
  }) async {
    await _client.sendCommand(
      'player_queues/play_media',
      args: {
        'queue_id': queueId,
        'media': media,
        'option': option?.value,
        'radio_mode': radioMode,
        'start_item': startItem,
      },
    );
  }

  /// Transfer queue to another queue.
  Future<void> transfer(String sourceQueueId, String targetQueueId, {bool? autoPlay}) async {
    await _client.sendCommand(
      'player_queues/transfer',
      args: {'source_queue_id': sourceQueueId, 'target_queue_id': targetQueueId, 'auto_play': autoPlay},
    );
  }

  /// Configure Don't stop the music setting on the queue.
  Future<void> dontStopTheMusic(String queueId, bool dontStopTheMusicEnabled) async {
    await _client.sendCommand(
      'player_queues/dont_stop_the_music',
      args: {'queue_id': queueId, 'dont_stop_the_music_enabled': dontStopTheMusicEnabled},
    );
  }

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
        final id = event.objectId;
        final data = event.data;
        if (id == null || data is! Map<String, dynamic>) break;
        _queues[id] = PlayerQueue.fromJson(data);
      default:
        break;
    }
  }
}
