enum EventType {
  playerAdded('player_added'),
  playerUpdated('player_updated'),
  playerRemoved('player_removed'),
  playerConfigUpdated('player_config_updated'),
  playerDspConfigUpdated('player_dsp_config_updated'),
  playerOptionsUpdated('player_options_updated'),
  dspPresetsUpdated('dsp_presets_updated'),
  queueAdded('queue_added'),
  queueUpdated('queue_updated'),
  queueItemsUpdated('queue_items_updated'),
  queueTimeUpdated('queue_time_updated'),
  mediaItemPlayed('media_item_played'),
  mediaItemAdded('media_item_added'),
  mediaItemUpdated('media_item_updated'),
  mediaItemDeleted('media_item_deleted'),
  providersUpdated('providers_updated'),
  syncTasksUpdated('sync_tasks_updated'),
  tasksUpdated('tasks_updated'),
  musicSyncCompleted('music_sync_completed'),
  authSession('auth_session'),
  coreStateUpdated('core_state_updated'),
  unknown('unknown');

  const EventType(this.value);

  final String value;

  static EventType fromValue(String value) =>
      EventType.values.firstWhere((e) => e.value == value, orElse: () => EventType.unknown);
}

class MusicAssistantEvent {
  final EventType type;
  final String? objectId;
  final Map<String, dynamic>? data;

  const MusicAssistantEvent({required this.type, this.objectId, this.data});
}
