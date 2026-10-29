import 'package:json_annotation/json_annotation.dart';

import 'media_items/media_item.dart';
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

  @JsonKey(name: 'sort_index', defaultValue: 0)
  int sortIndex = 0;

  @JsonKey(name: 'streamdetails')
  StreamDetails? streamdetails;

  /// The item being played, or an [ItemMapping] for a type not modeled here.
  @JsonKey(name: 'media_item')
  MediaItemBase? mediaItem;

  @JsonKey(name: 'image')
  MediaItemImage? image;

  @JsonKey(name: 'index', defaultValue: 0)
  int index = 0;

  @JsonKey(name: 'available', defaultValue: true)
  bool available = true;

  @JsonKey(name: 'extra_attributes', defaultValue: <String, dynamic>{})
  Map<String, dynamic> extraAttributes = {};

  factory QueueItem.fromJson(Map<String, dynamic> json) => _$QueueItemFromJson(json);
  Map<String, dynamic> toJson() => _$QueueItemToJson(this);
}
