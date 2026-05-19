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
