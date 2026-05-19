import 'package:json_annotation/json_annotation.dart';

import '../enums.dart';

part 'metadata.g.dart';

/// Model for a image.
@JsonSerializable()
class MediaItemImage {
  MediaItemImage();

  @JsonKey(name: 'type')
  ImageType? type;

  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'provider')
  String? provider;

  @JsonKey(name: 'remotely_accessible')
  bool remotelyAccessible = false;

  factory MediaItemImage.fromJson(Map<String, dynamic> json) => _$MediaItemImageFromJson(json);
  Map<String, dynamic> toJson() => _$MediaItemImageToJson(this);
}

/// Color palette derived from a MediaItem's artwork.
@JsonSerializable()
class MediaItemPalette {
  MediaItemPalette();

  @JsonKey(name: 'background_dark')
  (int, int, int)? backgroundDark;

  @JsonKey(name: 'background_light')
  (int, int, int)? backgroundLight;

  @JsonKey(name: 'primary')
  (int, int, int)? primary;

  @JsonKey(name: 'accent')
  (int, int, int)? accent;

  @JsonKey(name: 'on_dark')
  (int, int, int)? onDark;

  @JsonKey(name: 'on_light')
  (int, int, int)? onLight;

  factory MediaItemPalette.fromJson(Map<String, dynamic> json) => _$MediaItemPaletteFromJson(json);
  Map<String, dynamic> toJson() => _$MediaItemPaletteToJson(this);
}
