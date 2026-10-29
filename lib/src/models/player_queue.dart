import 'package:json_annotation/json_annotation.dart';

import 'enums.dart';
import 'queue_item.dart';

part 'player_queue.g.dart';

/// Representation of (the state of) a PlayerQueue within Music Assistant.
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

  @JsonKey(name: 'shuffle_enabled', defaultValue: false)
  bool shuffleEnabled = false;

  @JsonKey(name: 'repeat_mode', unknownEnumValue: RepeatMode.unknown, defaultValue: RepeatMode.off)
  RepeatMode repeatMode = RepeatMode.off;

  @JsonKey(name: 'dont_stop_the_music_enabled', defaultValue: false)
  bool dontStopTheMusicEnabled = false;

  @JsonKey(name: 'current_index')
  int? currentIndex;

  @JsonKey(name: 'index_in_buffer')
  int? indexInBuffer;

  @JsonKey(name: 'elapsed_time', defaultValue: 0)
  double elapsedTime = 0;

  @JsonKey(name: 'elapsed_time_last_updated')
  double? elapsedTimeLastUpdated;

  @JsonKey(name: 'state', unknownEnumValue: PlaybackState.unknown, defaultValue: PlaybackState.idle)
  PlaybackState state = PlaybackState.idle;

  @JsonKey(name: 'current_item')
  QueueItem? currentItem;

  @JsonKey(name: 'next_item')
  QueueItem? nextItem;

  @JsonKey(name: 'radio_source', defaultValue: <dynamic>[])
  List<dynamic> radioSource = [];

  @JsonKey(name: 'flow_mode', defaultValue: false)
  bool flowMode = false;

  @JsonKey(name: 'resume_pos', defaultValue: 0)
  int resumePos = 0;

  @JsonKey(name: 'extra_attributes', defaultValue: <String, dynamic>{})
  Map<String, dynamic> extraAttributes = {};

  double get correctedElapsedTime {
    if (state == PlaybackState.playing && elapsedTimeLastUpdated != null) {
      final now = DateTime.now().millisecondsSinceEpoch / 1000.0;
      return elapsedTime + (now - elapsedTimeLastUpdated!);
    }
    return elapsedTime;
  }

  factory PlayerQueue.fromJson(Map<String, dynamic> input) => _$PlayerQueueFromJson(input);
  Map<String, dynamic> toJson() => _$PlayerQueueToJson(this);
}
