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
  ..backgroundDark = _$recordConvertNullable(
    json['background_dark'],
    ($jsonValue) =>
        (($jsonValue[r'$1'] as num).toInt(), ($jsonValue[r'$2'] as num).toInt(), ($jsonValue[r'$3'] as num).toInt()),
  )
  ..backgroundLight = _$recordConvertNullable(
    json['background_light'],
    ($jsonValue) =>
        (($jsonValue[r'$1'] as num).toInt(), ($jsonValue[r'$2'] as num).toInt(), ($jsonValue[r'$3'] as num).toInt()),
  )
  ..primary = _$recordConvertNullable(
    json['primary'],
    ($jsonValue) =>
        (($jsonValue[r'$1'] as num).toInt(), ($jsonValue[r'$2'] as num).toInt(), ($jsonValue[r'$3'] as num).toInt()),
  )
  ..accent = _$recordConvertNullable(
    json['accent'],
    ($jsonValue) =>
        (($jsonValue[r'$1'] as num).toInt(), ($jsonValue[r'$2'] as num).toInt(), ($jsonValue[r'$3'] as num).toInt()),
  )
  ..onDark = _$recordConvertNullable(
    json['on_dark'],
    ($jsonValue) =>
        (($jsonValue[r'$1'] as num).toInt(), ($jsonValue[r'$2'] as num).toInt(), ($jsonValue[r'$3'] as num).toInt()),
  )
  ..onLight = _$recordConvertNullable(
    json['on_light'],
    ($jsonValue) =>
        (($jsonValue[r'$1'] as num).toInt(), ($jsonValue[r'$2'] as num).toInt(), ($jsonValue[r'$3'] as num).toInt()),
  );

Map<String, dynamic> _$MediaItemPaletteToJson(MediaItemPalette instance) => <String, dynamic>{
  'background_dark': instance.backgroundDark == null
      ? null
      : <String, dynamic>{
          r'$1': instance.backgroundDark!.$1,
          r'$2': instance.backgroundDark!.$2,
          r'$3': instance.backgroundDark!.$3,
        },
  'background_light': instance.backgroundLight == null
      ? null
      : <String, dynamic>{
          r'$1': instance.backgroundLight!.$1,
          r'$2': instance.backgroundLight!.$2,
          r'$3': instance.backgroundLight!.$3,
        },
  'primary': instance.primary == null
      ? null
      : <String, dynamic>{r'$1': instance.primary!.$1, r'$2': instance.primary!.$2, r'$3': instance.primary!.$3},
  'accent': instance.accent == null
      ? null
      : <String, dynamic>{r'$1': instance.accent!.$1, r'$2': instance.accent!.$2, r'$3': instance.accent!.$3},
  'on_dark': instance.onDark == null
      ? null
      : <String, dynamic>{r'$1': instance.onDark!.$1, r'$2': instance.onDark!.$2, r'$3': instance.onDark!.$3},
  'on_light': instance.onLight == null
      ? null
      : <String, dynamic>{r'$1': instance.onLight!.$1, r'$2': instance.onLight!.$2, r'$3': instance.onLight!.$3},
};

$Rec? _$recordConvertNullable<$Rec>(Object? value, $Rec Function(Map) convert) =>
    value == null ? null : convert(value as Map<String, dynamic>);
