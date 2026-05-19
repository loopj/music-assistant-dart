import 'package:json_annotation/json_annotation.dart';

import 'enums.dart';
import 'queue_item.dart';

part 'player_queue.g.dart';

@JsonSerializable()
class PlayerQueue {
  PlayerQueue();

  @JsonKey(name: 'queue_id')
  String? queueId;

  @JsonKey(name: 'active')
  bool? active;

  @JsonKey(name: 'display_name')
  String? displayName;

  @JsonKey(name: 'available')
  bool? available;

  @JsonKey(name: 'items')
  int? items;

  @JsonKey(name: 'shuffle_enabled')
  bool shuffleEnabled = false;

  @JsonKey(name: 'repeat_mode')
  RepeatMode repeatMode = RepeatMode.off;

  @JsonKey(name: 'dont_stop_the_music_enabled')
  bool dontStopTheMusicEnabled = false;

  @JsonKey(name: 'current_index')
  int? currentIndex;

  @JsonKey(name: 'index_in_buffer')
  int? indexInBuffer;

  @JsonKey(name: 'elapsed_time')
  double elapsedTime = 0;

  @JsonKey(name: 'elapsed_time_last_updated')
  double? elapsedTimeLastUpdated;

  @JsonKey(name: 'state')
  PlaybackState state = PlaybackState.idle;

  @JsonKey(name: 'current_item')
  QueueItem? currentItem;

  @JsonKey(name: 'next_item')
  QueueItem? nextItem;

  @JsonKey(name: 'radio_source')
  List<dynamic> radioSource = [];

  @JsonKey(name: 'flow_mode')
  bool flowMode = false;

  @JsonKey(name: 'resume_pos')
  int resumePos = 0;

  @JsonKey(name: 'extra_attributes')
  Map<String, dynamic> extraAttributes = {};

  factory PlayerQueue.fromJson(Map<String, dynamic> input) => _$PlayerQueueFromJson(input);
  Map<String, dynamic> toJson() => _$PlayerQueueToJson(this);
}
