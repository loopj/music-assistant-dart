import 'package:json_annotation/json_annotation.dart';

import 'enums.dart';
import 'media_items/audio_format.dart';

part 'stream_details.g.dart';

/// Metadata of a live broadcast / media stream.
@JsonSerializable()
class StreamMetadata {
  StreamMetadata();

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'artist')
  String? artist;

  @JsonKey(name: 'album')
  String? album;

  @JsonKey(name: 'image_url')
  String? imageUrl;

  @JsonKey(name: 'duration')
  int? duration;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'uri')
  String? uri;

  @JsonKey(name: 'elapsed_time')
  int? elapsedTime;

  @JsonKey(name: 'elapsed_time_last_updated')
  double? elapsedTimeLastUpdated;

  factory StreamMetadata.fromJson(Map<String, dynamic> json) => _$StreamMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$StreamMetadataToJson(this);
}

/// Model for a multipart path. Used when a stream is split into multiple parts, e.g. chapters.
@JsonSerializable()
class MultiPartPath {
  MultiPartPath();

  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'duration')
  double? duration;

  factory MultiPartPath.fromJson(Map<String, dynamic> json) => _$MultiPartPathFromJson(json);
  Map<String, dynamic> toJson() => _$MultiPartPathToJson(this);
}

/// Model for streamdetails.
@JsonSerializable()
class StreamDetails {
  StreamDetails();

  @JsonKey(name: 'provider')
  String? provider;

  @JsonKey(name: 'item_id')
  String? itemId;

  @JsonKey(name: 'audio_format')
  AudioFormat? audioFormat;

  @JsonKey(name: 'media_type')
  MediaType mediaType = MediaType.track;

  @JsonKey(name: 'stream_type')
  StreamType? streamType;

  @JsonKey(name: 'duration')
  int? duration;

  @JsonKey(name: 'size')
  int? size;

  @JsonKey(name: 'stream_metadata')
  StreamMetadata? streamMetadata;

  factory StreamDetails.fromJson(Map<String, dynamic> json) => _$StreamDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$StreamDetailsToJson(this);
}
