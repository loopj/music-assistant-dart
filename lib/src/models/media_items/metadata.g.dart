// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItemImage _$MediaItemImageFromJson(Map<String, dynamic> json) => MediaItemImage()
  ..type = $enumDecodeNullable(_$ImageTypeEnumMap, json['type'])
  ..path = json['path'] as String?
  ..provider = json['provider'] as String?
  ..remotelyAccessible = json['remotely_accessible'] as bool;

Map<String, dynamic> _$MediaItemImageToJson(MediaItemImage instance) => <String, dynamic>{
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

MediaItemPalette _$MediaItemPaletteFromJson(Map<String, dynamic> json) => MediaItemPalette()
  ..backgroundDark = const RgbConverter().fromJson(json['background_dark'] as List?)
  ..backgroundLight = const RgbConverter().fromJson(json['background_light'] as List?)
  ..primary = const RgbConverter().fromJson(json['primary'] as List?)
  ..accent = const RgbConverter().fromJson(json['accent'] as List?)
  ..onDark = const RgbConverter().fromJson(json['on_dark'] as List?)
  ..onLight = const RgbConverter().fromJson(json['on_light'] as List?);

Map<String, dynamic> _$MediaItemPaletteToJson(MediaItemPalette instance) => <String, dynamic>{
      'background_dark': const RgbConverter().toJson(instance.backgroundDark),
      'background_light': const RgbConverter().toJson(instance.backgroundLight),
      'primary': const RgbConverter().toJson(instance.primary),
      'accent': const RgbConverter().toJson(instance.accent),
      'on_dark': const RgbConverter().toJson(instance.onDark),
      'on_light': const RgbConverter().toJson(instance.onLight),
    };
