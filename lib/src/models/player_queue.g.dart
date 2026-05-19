// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerQueue _$PlayerQueueFromJson(Map<String, dynamic> json) => PlayerQueue()
  ..queueId = json['queue_id'] as String?
  ..active = json['active'] as bool?
  ..displayName = json['display_name'] as String?
  ..available = json['available'] as bool?
  ..items = (json['items'] as num?)?.toInt()
  ..shuffleEnabled = json['shuffle_enabled'] as bool
  ..repeatMode = $enumDecode(_$RepeatModeEnumMap, json['repeat_mode'])
  ..dontStopTheMusicEnabled = json['dont_stop_the_music_enabled'] as bool
  ..currentIndex = (json['current_index'] as num?)?.toInt()
  ..indexInBuffer = (json['index_in_buffer'] as num?)?.toInt()
  ..elapsedTime = (json['elapsed_time'] as num).toDouble()
  ..elapsedTimeLastUpdated = (json['elapsed_time_last_updated'] as num?)?.toDouble()
  ..state = $enumDecode(_$PlaybackStateEnumMap, json['state'])
  ..currentItem = json['current_item'] == null ? null : QueueItem.fromJson(json['current_item'] as Map<String, dynamic>)
  ..nextItem = json['next_item'] == null ? null : QueueItem.fromJson(json['next_item'] as Map<String, dynamic>)
  ..radioSource = json['radio_source'] as List<dynamic>
  ..flowMode = json['flow_mode'] as bool
  ..resumePos = (json['resume_pos'] as num).toInt()
  ..extraAttributes = json['extra_attributes'] as Map<String, dynamic>;

Map<String, dynamic> _$PlayerQueueToJson(PlayerQueue instance) => <String, dynamic>{
  'queue_id': instance.queueId,
  'active': instance.active,
  'display_name': instance.displayName,
  'available': instance.available,
  'items': instance.items,
  'shuffle_enabled': instance.shuffleEnabled,
  'repeat_mode': _$RepeatModeEnumMap[instance.repeatMode]!,
  'dont_stop_the_music_enabled': instance.dontStopTheMusicEnabled,
  'current_index': instance.currentIndex,
  'index_in_buffer': instance.indexInBuffer,
  'elapsed_time': instance.elapsedTime,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
  'state': _$PlaybackStateEnumMap[instance.state]!,
  'current_item': instance.currentItem,
  'next_item': instance.nextItem,
  'radio_source': instance.radioSource,
  'flow_mode': instance.flowMode,
  'resume_pos': instance.resumePos,
  'extra_attributes': instance.extraAttributes,
};

const _$RepeatModeEnumMap = {
  RepeatMode.off: 'off',
  RepeatMode.one: 'one',
  RepeatMode.all: 'all',
  RepeatMode.unknown: 'unknown',
};

const _$PlaybackStateEnumMap = {
  PlaybackState.idle: 'idle',
  PlaybackState.paused: 'paused',
  PlaybackState.playing: 'playing',
  PlaybackState.unknown: 'unknown',
};
