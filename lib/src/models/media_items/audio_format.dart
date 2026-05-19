import 'package:json_annotation/json_annotation.dart';

import '../enums.dart';

part 'audio_format.g.dart';

/// Model for AudioFormat details.
@JsonSerializable()
class AudioFormat {
  AudioFormat();

  @JsonKey(name: 'content_type')
  ContentType contentType = ContentType.unknown;

  @JsonKey(name: 'codec_type')
  ContentType codecType = ContentType.unknown;

  @JsonKey(name: 'sample_rate')
  int sampleRate = 44100;

  @JsonKey(name: 'bit_depth')
  int bitDepth = 16;

  @JsonKey(name: 'channels')
  int channels = 2;

  @JsonKey(name: 'output_format_str')
  String outputFormatStr = '';

  @JsonKey(name: 'bit_rate')
  int? bitRate;

  factory AudioFormat.fromJson(Map<String, dynamic> json) => _$AudioFormatFromJson(json);
  Map<String, dynamic> toJson() => _$AudioFormatToJson(this);
}
