// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamMetadata _$StreamMetadataFromJson(Map<String, dynamic> json) => StreamMetadata()
  ..title = json['title'] as String?
  ..artist = json['artist'] as String?
  ..album = json['album'] as String?
  ..imageUrl = json['image_url'] as String?
  ..duration = (json['duration'] as num?)?.toInt()
  ..description = json['description'] as String?
  ..uri = json['uri'] as String?
  ..elapsedTime = (json['elapsed_time'] as num?)?.toInt()
  ..elapsedTimeLastUpdated = (json['elapsed_time_last_updated'] as num?)?.toDouble();

Map<String, dynamic> _$StreamMetadataToJson(StreamMetadata instance) => <String, dynamic>{
  'title': instance.title,
  'artist': instance.artist,
  'album': instance.album,
  'image_url': instance.imageUrl,
  'duration': instance.duration,
  'description': instance.description,
  'uri': instance.uri,
  'elapsed_time': instance.elapsedTime,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
};

MultiPartPath _$MultiPartPathFromJson(Map<String, dynamic> json) => MultiPartPath()
  ..path = json['path'] as String?
  ..duration = (json['duration'] as num?)?.toDouble();

Map<String, dynamic> _$MultiPartPathToJson(MultiPartPath instance) => <String, dynamic>{
  'path': instance.path,
  'duration': instance.duration,
};

StreamDetails _$StreamDetailsFromJson(Map<String, dynamic> json) => StreamDetails()
  ..provider = json['provider'] as String?
  ..itemId = json['item_id'] as String?
  ..audioFormat = json['audio_format'] == null
      ? null
      : AudioFormat.fromJson(json['audio_format'] as Map<String, dynamic>)
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'])
  ..streamType = $enumDecodeNullable(_$StreamTypeEnumMap, json['stream_type'])
  ..duration = (json['duration'] as num?)?.toInt()
  ..size = (json['size'] as num?)?.toInt()
  ..streamMetadata = json['stream_metadata'] == null
      ? null
      : StreamMetadata.fromJson(json['stream_metadata'] as Map<String, dynamic>);

Map<String, dynamic> _$StreamDetailsToJson(StreamDetails instance) => <String, dynamic>{
  'provider': instance.provider,
  'item_id': instance.itemId,
  'audio_format': instance.audioFormat,
  'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
  'stream_type': _$StreamTypeEnumMap[instance.streamType],
  'duration': instance.duration,
  'size': instance.size,
  'stream_metadata': instance.streamMetadata,
};

const _$MediaTypeEnumMap = {
  MediaType.artist: 'artist',
  MediaType.album: 'album',
  MediaType.track: 'track',
  MediaType.playlist: 'playlist',
  MediaType.radio: 'radio',
  MediaType.audiobook: 'audiobook',
  MediaType.podcast: 'podcast',
  MediaType.podcastEpisode: 'podcast_episode',
  MediaType.folder: 'folder',
  MediaType.announcement: 'announcement',
  MediaType.flowStream: 'flow_stream',
  MediaType.pluginSource: 'plugin_source',
  MediaType.soundEffect: 'sound_effect',
  MediaType.genre: 'genre',
  MediaType.unknown: 'unknown',
};

const _$StreamTypeEnumMap = {
  StreamType.http: 'http',
  StreamType.encryptedHttp: 'encrypted_http',
  StreamType.hls: 'hls',
  StreamType.icy: 'icy',
  StreamType.shoutcast: 'shoutcast',
  StreamType.inBand: 'in_band',
  StreamType.localFile: 'local_file',
  StreamType.namedPipe: 'named_pipe',
  StreamType.otherFfmpeg: 'other_ffmpeg',
  StreamType.custom: 'custom',
  StreamType.unknown: 'unknown',
};
