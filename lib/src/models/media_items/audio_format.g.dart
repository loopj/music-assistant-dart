// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioFormat _$AudioFormatFromJson(Map<String, dynamic> json) => AudioFormat()
  ..contentType = $enumDecode(_$ContentTypeEnumMap, json['content_type'])
  ..codecType = $enumDecode(_$ContentTypeEnumMap, json['codec_type'])
  ..sampleRate = (json['sample_rate'] as num).toInt()
  ..bitDepth = (json['bit_depth'] as num).toInt()
  ..channels = (json['channels'] as num).toInt()
  ..outputFormatStr = json['output_format_str'] as String
  ..bitRate = (json['bit_rate'] as num?)?.toInt();

Map<String, dynamic> _$AudioFormatToJson(AudioFormat instance) =>
    <String, dynamic>{
      'content_type': _$ContentTypeEnumMap[instance.contentType]!,
      'codec_type': _$ContentTypeEnumMap[instance.codecType]!,
      'sample_rate': instance.sampleRate,
      'bit_depth': instance.bitDepth,
      'channels': instance.channels,
      'output_format_str': instance.outputFormatStr,
      'bit_rate': instance.bitRate,
    };

const _$ContentTypeEnumMap = {
  ContentType.ogg: 'ogg',
  ContentType.wav: 'wav',
  ContentType.aiff: 'aiff',
  ContentType.mpeg: 'mpeg',
  ContentType.m4a: 'm4a',
  ContentType.mp4: 'mp4',
  ContentType.mp4a: 'mp4a',
  ContentType.m4b: 'm4b',
  ContentType.dsf: 'dsf',
  ContentType.flac: 'flac',
  ContentType.mp3: 'mp3',
  ContentType.wma: 'wma',
  ContentType.wmav2: 'wmav2',
  ContentType.wmapro: 'wmapro',
  ContentType.wavpack: 'wavpack',
  ContentType.tak: 'tak',
  ContentType.ape: 'ape',
  ContentType.musepack: 'mpc',
  ContentType.aac: 'aac',
  ContentType.alac: 'alac',
  ContentType.opus: 'opus',
  ContentType.vorbis: 'vorbis',
  ContentType.ac3: 'ac3',
  ContentType.eac3: 'eac3',
  ContentType.dts: 'dts',
  ContentType.truehd: 'truehd',
  ContentType.dtshd: 'dtshd',
  ContentType.dtsx: 'dtsx',
  ContentType.cook: 'cook',
  ContentType.ra144: 'ralf',
  ContentType.mp2: 'mp2',
  ContentType.mp1: 'mp1',
  ContentType.dra: 'dra',
  ContentType.atrac3: 'atrac3',
  ContentType.pcmS16le: 's16le',
  ContentType.pcmS24le: 's24le',
  ContentType.pcmS32le: 's32le',
  ContentType.pcmF32le: 'f32le',
  ContentType.pcmF64le: 'f64le',
  ContentType.pcmS16be: 's16be',
  ContentType.pcmS24be: 's24be',
  ContentType.pcmS32be: 's32be',
  ContentType.pcmBluray: 'pcm_bluray',
  ContentType.pcmDvd: 'pcm_dvd',
  ContentType.adpcmIma: 'adpcm_ima_qt',
  ContentType.adpcmMs: 'adpcm_ms',
  ContentType.adpcmSwf: 'adpcm_swf',
  ContentType.dsdLsbf: 'dsd_lsbf',
  ContentType.dsdMsbf: 'dsd_msbf',
  ContentType.dsdLsbfPlanar: 'dsd_lsbf_planar',
  ContentType.dsdMsbfPlanar: 'dsd_msbf_planar',
  ContentType.amr: 'amr_nb',
  ContentType.amrWb: 'amr_wb',
  ContentType.speex: 'speex',
  ContentType.pcmAlaw: 'alaw',
  ContentType.pcmMulaw: 'mulaw',
  ContentType.g722: 'g722',
  ContentType.g726: 'g726',
  ContentType.pcm: 'pcm',
  ContentType.nut: 'nut',
  ContentType.unknown: '?',
};
