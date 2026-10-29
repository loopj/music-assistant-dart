import 'package:json_annotation/json_annotation.dart';

import '../access.dart';
import '../converters.dart';
import '../enums.dart';
import 'metadata.dart';
import 'provider_mapping.dart';

part 'media_item.g.dart';

/// Base representation of a media item or of a reduced reference to one.
sealed class MediaItemBase {
  MediaItemBase(this.mediaType);

  /// Parse a full media item, or an [ItemMapping] when the server sends a reduced reference or a type not modeled here.
  factory MediaItemBase.fromJson(Map<String, dynamic> json) =>
      switch (json.containsKey('provider_mappings') ? json['media_type'] : null) {
        'artist' => Artist.fromJson(json),
        'album' => Album.fromJson(json),
        'track' => Track.fromJson(json),
        'playlist' => Playlist.fromJson(json),
        'radio' => Radio.fromJson(json),
        'audiobook' => Audiobook.fromJson(json),
        'podcast' => Podcast.fromJson(json),
        'podcast_episode' => PodcastEpisode.fromJson(json),
        'genre' => Genre.fromJson(json),
        'sound_effect' => SoundEffect.fromJson(json),
        _ => ItemMapping.fromJson(json),
      };

  Map<String, dynamic> toJson();

  @JsonKey(name: 'item_id')
  String? itemId;

  @JsonKey(name: 'provider')
  String? provider;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'version')
  String version = '';

  @JsonKey(name: 'sort_name')
  String? sortName;

  @JsonKey(name: 'uri')
  String? uri;

  /// External ids as `[type, value]` pairs, such as a MusicBrainz id.
  @JsonKey(name: 'external_ids')
  List<List<String>> externalIds = [];

  @JsonKey(name: 'is_playable')
  bool isPlayable = true;

  @JsonKey(name: 'media_type')
  MediaType mediaType;
}

/// Reduced reference to a media item, such as the album of a track in a listing.
@JsonSerializable()
class ItemMapping extends MediaItemBase {
  ItemMapping() : super(MediaType.unknown);

  /// Key the server uses to localize [name].
  @JsonKey(name: 'translation_key')
  String? translationKey;

  @JsonKey(name: 'available', defaultValue: true)
  bool available = true;

  @JsonKey(name: 'image')
  MediaItemImage? image;

  @JsonKey(name: 'year')
  int? year;

  factory ItemMapping.fromJson(Map<String, dynamic> json) => _$ItemMappingFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ItemMappingToJson(this);
}

/// Base representation of a media item.
sealed class MediaItem extends MediaItemBase {
  MediaItem(super.mediaType);

  @JsonKey(name: 'provider_mappings', defaultValue: <ProviderMapping>[])
  List<ProviderMapping> providerMappings = [];

  @JsonKey(name: 'metadata')
  MediaItemMetadata? metadata;

  /// True for a like, false for a dislike, and null when the user expressed nothing.
  @JsonKey(name: 'favorite')
  bool? favorite;

  /// Sort position within the parent, such as a playlist or podcast.
  @JsonKey(name: 'position')
  int? position;

  @JsonKey(name: 'date_added')
  DateTime? dateAdded;
}

/// Model for a genre.
@JsonSerializable()
class Genre extends MediaItem {
  Genre() : super(MediaType.genre);

  /// Key the server uses to localize [name].
  @JsonKey(name: 'translation_key')
  String? translationKey;

  /// Taxonomy the genre belongs to, podcast or audiobook, or null for music.
  @JsonKey(name: 'content_type', unknownEnumValue: MediaType.unknown)
  MediaType? contentType;

  /// Alternative names that map to this genre.
  @JsonKey(name: 'genre_aliases')
  Set<String>? genreAliases;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

/// Model for an artist.
@JsonSerializable()
class Artist extends MediaItem {
  Artist() : super(MediaType.artist);

  @JsonKey(name: 'artist_type', unknownEnumValue: ArtistType.unknown, defaultValue: ArtistType.singer)
  ArtistType artistType = ArtistType.singer;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}

/// Model for an album.
@JsonSerializable()
class Album extends MediaItem {
  Album() : super(MediaType.album);

  @JsonKey(name: 'year')
  int? year;

  /// Each artist in full, or as an [ItemMapping].
  @JsonKey(name: 'artists', defaultValue: <MediaItemBase>[])
  List<MediaItemBase> artists = [];

  @JsonKey(name: 'album_type', unknownEnumValue: AlbumType.unknown, defaultValue: AlbumType.unknown)
  AlbumType albumType = AlbumType.unknown;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

/// Model for a track.
@JsonSerializable()
class Track extends MediaItem {
  Track() : super(MediaType.track);

  /// Length in seconds.
  @JsonKey(name: 'duration', defaultValue: 0)
  int duration = 0;

  /// Each artist in full, or as an [ItemMapping].
  @JsonKey(name: 'artists', defaultValue: <MediaItemBase>[])
  List<MediaItemBase> artists = [];

  /// Unix time the track was last played, only set for library tracks.
  @JsonKey(name: 'last_played', defaultValue: 0)
  int lastPlayed = 0;

  /// The album in full or as an [ItemMapping], or null when the track has none.
  @JsonKey(name: 'album')
  MediaItemBase? album;

  @JsonKey(name: 'disc_number', defaultValue: 0)
  int discNumber = 0;

  @JsonKey(name: 'track_number', defaultValue: 0)
  int trackNumber = 0;

  /// Tempo and key from audio analysis, only set when the full track is requested.
  @JsonKey(name: 'audio_metadata')
  AudioMetadata? audioMetadata;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}

/// Model for a playlist.
@JsonSerializable()
class Playlist extends MediaItem {
  Playlist() : super(MediaType.playlist);

  /// Key the server uses to localize [name].
  @JsonKey(name: 'translation_key')
  String? translationKey;

  /// Values for the placeholders in the localized [name].
  @JsonKey(name: 'translation_params')
  List<String>? translationParams;

  /// Display name of the owner, unrelated to the user id in [access].
  @JsonKey(name: 'owner')
  String owner = '';

  @JsonKey(name: 'is_editable')
  bool isEditable = false;

  /// Whether the provider yields tracks on demand without end, like Deezer Flow.
  @JsonKey(name: 'is_dynamic')
  bool isDynamic = false;

  @JsonKey(name: 'supported_mediatypes', unknownEnumValue: MediaType.unknown)
  Set<MediaType> supportedMediatypes = {MediaType.track};

  /// Who the playlist serves, or null when it serves everyone.
  @JsonKey(name: 'access')
  PlaylistAccess? access;

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}

/// Model for a radio station.
@JsonSerializable()
class Radio extends MediaItem {
  Radio() : super(MediaType.radio);

  /// Key the server uses to localize [name].
  @JsonKey(name: 'translation_key')
  String? translationKey;

  /// Values for the placeholders in the localized [name].
  @JsonKey(name: 'translation_params')
  List<String>? translationParams;

  @JsonKey(name: 'duration')
  int? duration;

  /// Whether the tracklist changes on every fetch.
  @JsonKey(name: 'is_dynamic')
  bool isDynamic = false;

  /// Whether playback never ends, such as a broadcast stream.
  @JsonKey(name: 'is_endless', defaultValue: true)
  bool isEndless = true;

  factory Radio.fromJson(Map<String, dynamic> json) => _$RadioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RadioToJson(this);
}

/// Model for an audiobook.
@JsonSerializable()
class Audiobook extends MediaItem {
  Audiobook() : super(MediaType.audiobook);

  @JsonKey(name: 'publisher')
  String? publisher;

  /// Author names, read from plain names or from artist objects.
  @JsonKey(name: 'authors', defaultValue: <String>[])
  @NameListConverter()
  List<String> authors = [];

  /// Narrator names, read from plain names or from artist objects.
  @JsonKey(name: 'narrators', defaultValue: <String>[])
  @NameListConverter()
  List<String> narrators = [];

  /// Length in seconds.
  @JsonKey(name: 'duration', defaultValue: 0)
  int duration = 0;

  /// Whether the audiobook was played to the end, or null when the provider cannot tell.
  @JsonKey(name: 'fully_played')
  @FlexibleBoolConverter()
  bool? fullyPlayed;

  /// Resume point in milliseconds, or null when the provider cannot tell.
  @JsonKey(name: 'resume_position_ms')
  int? resumePositionMs;

  factory Audiobook.fromJson(Map<String, dynamic> json) => _$AudiobookFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AudiobookToJson(this);
}

/// Model for a podcast.
@JsonSerializable()
class Podcast extends MediaItem {
  Podcast() : super(MediaType.podcast);

  /// Key the server uses to localize [name].
  @JsonKey(name: 'translation_key')
  String? translationKey;

  @JsonKey(name: 'publisher')
  String? publisher;

  @JsonKey(name: 'total_episodes')
  int? totalEpisodes;

  factory Podcast.fromJson(Map<String, dynamic> json) => _$PodcastFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PodcastToJson(this);
}

/// Model for a podcast episode.
@JsonSerializable()
class PodcastEpisode extends MediaItem {
  PodcastEpisode() : super(MediaType.podcastEpisode);

  /// The podcast in full, or as an [ItemMapping].
  @JsonKey(name: 'podcast')
  MediaItemBase? podcast;

  /// Length in seconds.
  @JsonKey(name: 'duration')
  int duration = 0;

  /// Episode number from the publisher, or null when it does not number them.
  @JsonKey(name: 'episode_number')
  int? episodeNumber;

  @JsonKey(name: 'season')
  int? season;

  /// Whether the episode was played to the end, or null when the provider cannot tell.
  @JsonKey(name: 'fully_played')
  @FlexibleBoolConverter()
  bool? fullyPlayed;

  /// Resume point in milliseconds, or null when the provider cannot tell.
  @JsonKey(name: 'resume_position_ms')
  int? resumePositionMs;

  factory PodcastEpisode.fromJson(Map<String, dynamic> json) => _$PodcastEpisodeFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PodcastEpisodeToJson(this);
}

/// Model for a sound effect.
@JsonSerializable()
class SoundEffect extends MediaItem {
  SoundEffect() : super(MediaType.soundEffect);

  /// Key the server uses to localize [name].
  @JsonKey(name: 'translation_key')
  String? translationKey;

  /// Length in seconds.
  @JsonKey(name: 'duration', defaultValue: 0)
  int duration = 0;

  factory SoundEffect.fromJson(Map<String, dynamic> json) => _$SoundEffectFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SoundEffectToJson(this);
}
