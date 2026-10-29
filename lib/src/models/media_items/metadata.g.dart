// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItemImage _$MediaItemImageFromJson(Map<String, dynamic> json) => MediaItemImage()
  ..type = $enumDecodeNullable(_$ImageTypeEnumMap, json['type'], unknownValue: ImageType.other)
  ..path = json['path'] as String?
  ..provider = json['provider'] as String?
  ..remotelyAccessible = json['remotely_accessible'] as bool? ?? false;

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

AudioMetadata _$AudioMetadataFromJson(Map<String, dynamic> json) => AudioMetadata()
  ..bpm = (json['bpm'] as num?)?.toDouble()
  ..musicalKey = json['musical_key'] as String?
  ..camelotKey = json['camelot_key'] as String?;

Map<String, dynamic> _$AudioMetadataToJson(AudioMetadata instance) => <String, dynamic>{
      'bpm': instance.bpm,
      'musical_key': instance.musicalKey,
      'camelot_key': instance.camelotKey,
    };

MediaItemChapter _$MediaItemChapterFromJson(Map<String, dynamic> json) => MediaItemChapter()
  ..position = (json['position'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..start = (json['start'] as num?)?.toDouble()
  ..end = (json['end'] as num?)?.toDouble();

Map<String, dynamic> _$MediaItemChapterToJson(MediaItemChapter instance) => <String, dynamic>{
      'position': instance.position,
      'name': instance.name,
      'start': instance.start,
      'end': instance.end,
    };

MediaItemMetadata _$MediaItemMetadataFromJson(Map<String, dynamic> json) => MediaItemMetadata()
  ..description = json['description'] as String?
  ..descriptionLanguage = json['description_language'] as String?
  ..review = json['review'] as String?
  ..explicit = json['explicit'] as bool?
  ..images = (json['images'] as List<dynamic>?)?.map((e) => MediaItemImage.fromJson(e as Map<String, dynamic>)).toList()
  ..grouping = json['grouping'] as String?
  ..genres = (json['genres'] as List<dynamic>?)?.map((e) => e as String).toSet()
  ..mood = json['mood'] as String?
  ..style = json['style'] as String?
  ..copyright = json['copyright'] as String?
  ..lyrics = json['lyrics'] as String?
  ..lrcLyrics = json['lrc_lyrics'] as String?
  ..transcript = json['transcript'] as String?
  ..hasTranscript = json['has_transcript'] as bool?
  ..label = json['label'] as String?
  ..performers = (json['performers'] as List<dynamic>?)?.map((e) => e as String).toSet()
  ..preview = json['preview'] as String?
  ..popularity = (json['popularity'] as num?)?.toInt()
  ..releaseDate = json['release_date'] == null ? null : DateTime.parse(json['release_date'] as String)
  ..languages = (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..chapters =
      (json['chapters'] as List<dynamic>?)?.map((e) => MediaItemChapter.fromJson(e as Map<String, dynamic>)).toList()
  ..lastRefresh = (json['last_refresh'] as num?)?.toInt()
  ..lastMusicbrainzLookup = (json['last_musicbrainz_lookup'] as num?)?.toInt();

Map<String, dynamic> _$MediaItemMetadataToJson(MediaItemMetadata instance) => <String, dynamic>{
      'description': instance.description,
      'description_language': instance.descriptionLanguage,
      'review': instance.review,
      'explicit': instance.explicit,
      'images': instance.images,
      'grouping': instance.grouping,
      'genres': instance.genres?.toList(),
      'mood': instance.mood,
      'style': instance.style,
      'copyright': instance.copyright,
      'lyrics': instance.lyrics,
      'lrc_lyrics': instance.lrcLyrics,
      'transcript': instance.transcript,
      'has_transcript': instance.hasTranscript,
      'label': instance.label,
      'performers': instance.performers?.toList(),
      'preview': instance.preview,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate?.toIso8601String(),
      'languages': instance.languages,
      'chapters': instance.chapters,
      'last_refresh': instance.lastRefresh,
      'last_musicbrainz_lookup': instance.lastMusicbrainzLookup,
    };
