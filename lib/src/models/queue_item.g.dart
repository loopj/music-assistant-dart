// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueueItem _$QueueItemFromJson(Map<String, dynamic> json) => QueueItem()
  ..queueId = json['queue_id'] as String?
  ..queueItemId = json['queue_item_id'] as String?
  ..name = json['name'] as String?
  ..duration = (json['duration'] as num?)?.toInt()
  ..sortIndex = (json['sort_index'] as num).toInt()
  ..streamdetails = json['streamdetails'] == null
      ? null
      : StreamDetails.fromJson(json['streamdetails'] as Map<String, dynamic>)
  ..mediaItem = json['media_item'] as Map<String, dynamic>?
  ..image = json['image'] == null ? null : MediaItemImage.fromJson(json['image'] as Map<String, dynamic>)
  ..index = (json['index'] as num).toInt()
  ..available = json['available'] as bool
  ..extraAttributes = json['extra_attributes'] as Map<String, dynamic>;

Map<String, dynamic> _$QueueItemToJson(QueueItem instance) => <String, dynamic>{
  'queue_id': instance.queueId,
  'queue_item_id': instance.queueItemId,
  'name': instance.name,
  'duration': instance.duration,
  'sort_index': instance.sortIndex,
  'streamdetails': instance.streamdetails,
  'media_item': instance.mediaItem,
  'image': instance.image,
  'index': instance.index,
  'available': instance.available,
  'extra_attributes': instance.extraAttributes,
};
