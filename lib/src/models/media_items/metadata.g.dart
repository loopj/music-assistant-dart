// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItemImage _$MediaItemImageFromJson(Map<String, dynamic> json) =>
    MediaItemImage()
      ..type = $enumDecodeNullable(_$ImageTypeEnumMap, json['type'])
      ..path = json['path'] as String?
      ..provider = json['provider'] as String?
      ..remotelyAccessible = json['remotely_accessible'] as bool;

Map<String, dynamic> _$MediaItemImageToJson(MediaItemImage instance) =>
    <String, dynamic>{
      'type': _$ImageTypeEnumMap[instance.type],
      'path': instance.path,
      'provider': instance.provider,
      'remotely_accessible': instance.remotelyAccessible,
    };

const _$ImageTypeEnumMap = {
  ImageType.thumb: 'thumb',
  ImageType.landscape: 'landscape',
  ImageType.fanart: 'fanart',
  ImageType.logo: 'logo',
  ImageType.clearart: 'clearart',
  ImageType.banner: 'banner',
  ImageType.cutout: 'cutout',
  ImageType.back: 'back',
  ImageType.discart: 'discart',
  ImageType.other: 'other',
};
