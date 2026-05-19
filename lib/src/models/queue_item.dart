import 'package:json_annotation/json_annotation.dart';

import 'media_items/metadata.dart';
import 'stream_details.dart';

part 'queue_item.g.dart';

/// Representation of a queue item.
@JsonSerializable()
class QueueItem {
  QueueItem();

  @JsonKey(name: 'queue_id')
  String? queueId;

  @JsonKey(name: 'queue_item_id')
  String? queueItemId;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'duration')
  int? duration;

  @JsonKey(name: 'sort_index')
  int sortIndex = 0;

  @JsonKey(name: 'streamdetails')
  StreamDetails? streamdetails;

  @JsonKey(name: 'media_item')
  Map<String, dynamic>? mediaItem;

  @JsonKey(name: 'image')
  MediaItemImage? image;

  @JsonKey(name: 'index')
  int index = 0;

  @JsonKey(name: 'available')
  bool available = true;

  @JsonKey(name: 'extra_attributes')
  Map<String, dynamic> extraAttributes = {};

  factory QueueItem.fromJson(Map<String, dynamic> json) => _$QueueItemFromJson(json);
  Map<String, dynamic> toJson() => _$QueueItemToJson(this);
}
