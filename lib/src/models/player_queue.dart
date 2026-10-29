import 'package:json_annotation/json_annotation.dart';

import 'enums.dart';
import 'media_items/media_item.dart';
import 'queue_item.dart';

part 'player_queue.g.dart';

// Read the autoplay flag, falling back to the legacy key, like upstream
Object? _readAutoplayEnabled(Map<dynamic, dynamic> json, String key) =>
    json[key] ?? json['dont_stop_the_music_enabled'];

// Read the queue sources, falling back to the legacy key, like upstream
Object? _readSources(Map<dynamic, dynamic> json, String key) => json[key] ?? json['radio_source'];

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

  /// Whether the queue keeps playing similar items once it runs out.
  @JsonKey(name: 'autoplay_enabled', readValue: _readAutoplayEnabled, defaultValue: false)
  bool autoplayEnabled = false;

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

  /// Items the queue plays from, such as a playlist, each in full or as an [ItemMapping].
  @JsonKey(name: 'sources', readValue: _readSources, defaultValue: <MediaItemBase>[])
  List<MediaItemBase> sources = [];

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
