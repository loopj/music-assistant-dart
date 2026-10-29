// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemMapping _$ItemMappingFromJson(Map<String, dynamic> json) => ItemMapping()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..translationKey = json['translation_key'] as String?
  ..available = json['available'] as bool? ?? true
  ..image = json['image'] == null ? null : MediaItemImage.fromJson(json['image'] as Map<String, dynamic>)
  ..year = (json['year'] as num?)?.toInt();

Map<String, dynamic> _$ItemMappingToJson(ItemMapping instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'translation_key': instance.translationKey,
      'available': instance.available,
      'image': instance.image,
      'year': instance.year,
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

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..translationKey = json['translation_key'] as String?
  ..contentType = $enumDecodeNullable(_$MediaTypeEnumMap, json['content_type'], unknownValue: MediaType.unknown)
  ..genreAliases = (json['genre_aliases'] as List<dynamic>?)?.map((e) => e as String).toSet();

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'translation_key': instance.translationKey,
      'content_type': _$MediaTypeEnumMap[instance.contentType],
      'genre_aliases': instance.genreAliases?.toList(),
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..artistType = $enumDecodeNullable(_$ArtistTypeEnumMap, json['artist_type'], unknownValue: ArtistType.unknown) ??
      ArtistType.singer;

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'artist_type': _$ArtistTypeEnumMap[instance.artistType]!,
    };

const _$ArtistTypeEnumMap = {
  ArtistType.singer: 'singer',
  ArtistType.author: 'author',
  ArtistType.narrator: 'narrator',
  ArtistType.unknown: 'unknown',
};

Album _$AlbumFromJson(Map<String, dynamic> json) => Album()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..year = (json['year'] as num?)?.toInt()
  ..artists =
      (json['artists'] as List<dynamic>?)?.map((e) => MediaItemBase.fromJson(e as Map<String, dynamic>)).toList() ?? []
  ..albumType =
      $enumDecodeNullable(_$AlbumTypeEnumMap, json['album_type'], unknownValue: AlbumType.unknown) ?? AlbumType.unknown;

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'year': instance.year,
      'artists': instance.artists,
      'album_type': _$AlbumTypeEnumMap[instance.albumType]!,
    };

const _$AlbumTypeEnumMap = {
  AlbumType.album: 'album',
  AlbumType.single: 'single',
  AlbumType.live: 'live',
  AlbumType.soundtrack: 'soundtrack',
  AlbumType.compilation: 'compilation',
  AlbumType.ep: 'ep',
  AlbumType.unknown: 'unknown',
};

Track _$TrackFromJson(Map<String, dynamic> json) => Track()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..duration = (json['duration'] as num?)?.toInt() ?? 0
  ..artists =
      (json['artists'] as List<dynamic>?)?.map((e) => MediaItemBase.fromJson(e as Map<String, dynamic>)).toList() ?? []
  ..lastPlayed = (json['last_played'] as num?)?.toInt() ?? 0
  ..album = json['album'] == null ? null : MediaItemBase.fromJson(json['album'] as Map<String, dynamic>)
  ..discNumber = (json['disc_number'] as num?)?.toInt() ?? 0
  ..trackNumber = (json['track_number'] as num?)?.toInt() ?? 0
  ..audioMetadata =
      json['audio_metadata'] == null ? null : AudioMetadata.fromJson(json['audio_metadata'] as Map<String, dynamic>);

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'duration': instance.duration,
      'artists': instance.artists,
      'last_played': instance.lastPlayed,
      'album': instance.album,
      'disc_number': instance.discNumber,
      'track_number': instance.trackNumber,
      'audio_metadata': instance.audioMetadata,
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..translationKey = json['translation_key'] as String?
  ..translationParams = (json['translation_params'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..owner = json['owner'] as String
  ..isEditable = json['is_editable'] as bool
  ..isDynamic = json['is_dynamic'] as bool
  ..supportedMediatypes = (json['supported_mediatypes'] as List<dynamic>)
      .map((e) => $enumDecode(_$MediaTypeEnumMap, e, unknownValue: MediaType.unknown))
      .toSet()
  ..access = json['access'] == null ? null : PlaylistAccess.fromJson(json['access'] as Map<String, dynamic>);

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'translation_key': instance.translationKey,
      'translation_params': instance.translationParams,
      'owner': instance.owner,
      'is_editable': instance.isEditable,
      'is_dynamic': instance.isDynamic,
      'supported_mediatypes': instance.supportedMediatypes.map((e) => _$MediaTypeEnumMap[e]!).toList(),
      'access': instance.access,
    };

Radio _$RadioFromJson(Map<String, dynamic> json) => Radio()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..translationKey = json['translation_key'] as String?
  ..translationParams = (json['translation_params'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..duration = (json['duration'] as num?)?.toInt()
  ..isDynamic = json['is_dynamic'] as bool
  ..isEndless = json['is_endless'] as bool? ?? true;

Map<String, dynamic> _$RadioToJson(Radio instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'translation_key': instance.translationKey,
      'translation_params': instance.translationParams,
      'duration': instance.duration,
      'is_dynamic': instance.isDynamic,
      'is_endless': instance.isEndless,
    };

Audiobook _$AudiobookFromJson(Map<String, dynamic> json) => Audiobook()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..publisher = json['publisher'] as String?
  ..authors = json['authors'] == null ? [] : const NameListConverter().fromJson(json['authors'] as List)
  ..narrators = json['narrators'] == null ? [] : const NameListConverter().fromJson(json['narrators'] as List)
  ..duration = (json['duration'] as num?)?.toInt() ?? 0
  ..fullyPlayed = const FlexibleBoolConverter().fromJson(json['fully_played'])
  ..resumePositionMs = (json['resume_position_ms'] as num?)?.toInt();

Map<String, dynamic> _$AudiobookToJson(Audiobook instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'publisher': instance.publisher,
      'authors': const NameListConverter().toJson(instance.authors),
      'narrators': const NameListConverter().toJson(instance.narrators),
      'duration': instance.duration,
      'fully_played': const FlexibleBoolConverter().toJson(instance.fullyPlayed),
      'resume_position_ms': instance.resumePositionMs,
    };

Podcast _$PodcastFromJson(Map<String, dynamic> json) => Podcast()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..translationKey = json['translation_key'] as String?
  ..publisher = json['publisher'] as String?
  ..totalEpisodes = (json['total_episodes'] as num?)?.toInt();

Map<String, dynamic> _$PodcastToJson(Podcast instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'translation_key': instance.translationKey,
      'publisher': instance.publisher,
      'total_episodes': instance.totalEpisodes,
    };

PodcastEpisode _$PodcastEpisodeFromJson(Map<String, dynamic> json) => PodcastEpisode()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..podcast = json['podcast'] == null ? null : MediaItemBase.fromJson(json['podcast'] as Map<String, dynamic>)
  ..duration = (json['duration'] as num).toInt()
  ..episodeNumber = (json['episode_number'] as num?)?.toInt()
  ..season = (json['season'] as num?)?.toInt()
  ..fullyPlayed = const FlexibleBoolConverter().fromJson(json['fully_played'])
  ..resumePositionMs = (json['resume_position_ms'] as num?)?.toInt();

Map<String, dynamic> _$PodcastEpisodeToJson(PodcastEpisode instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'podcast': instance.podcast,
      'duration': instance.duration,
      'episode_number': instance.episodeNumber,
      'season': instance.season,
      'fully_played': const FlexibleBoolConverter().toJson(instance.fullyPlayed),
      'resume_position_ms': instance.resumePositionMs,
    };

SoundEffect _$SoundEffectFromJson(Map<String, dynamic> json) => SoundEffect()
  ..itemId = json['item_id'] as String?
  ..provider = json['provider'] as String?
  ..name = json['name'] as String?
  ..version = json['version'] as String
  ..sortName = json['sort_name'] as String?
  ..uri = json['uri'] as String?
  ..externalIds =
      (json['external_ids'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()
  ..isPlayable = json['is_playable'] as bool
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'], unknownValue: MediaType.unknown)
  ..providerMappings = (json['provider_mappings'] as List<dynamic>?)
          ?.map((e) => ProviderMapping.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..metadata = json['metadata'] == null ? null : MediaItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
  ..favorite = json['favorite'] as bool?
  ..position = (json['position'] as num?)?.toInt()
  ..dateAdded = json['date_added'] == null ? null : DateTime.parse(json['date_added'] as String)
  ..translationKey = json['translation_key'] as String?
  ..duration = (json['duration'] as num?)?.toInt() ?? 0;

Map<String, dynamic> _$SoundEffectToJson(SoundEffect instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider': instance.provider,
      'name': instance.name,
      'version': instance.version,
      'sort_name': instance.sortName,
      'uri': instance.uri,
      'external_ids': instance.externalIds,
      'is_playable': instance.isPlayable,
      'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
      'provider_mappings': instance.providerMappings,
      'metadata': instance.metadata,
      'favorite': instance.favorite,
      'position': instance.position,
      'date_added': instance.dateAdded?.toIso8601String(),
      'translation_key': instance.translationKey,
      'duration': instance.duration,
    };
