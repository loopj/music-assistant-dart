import 'package:json_annotation/json_annotation.dart';

import '../converters.dart';
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
@JsonSerializable(converters: [RgbConverter()])
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

/// Model for audio-analysis-derived metadata of a track.
@JsonSerializable()
class AudioMetadata {
  AudioMetadata();

  /// Beats per minute.
  @JsonKey(name: 'bpm')
  double? bpm;

  /// Pitch class plus mode, such as "F# minor".
  @JsonKey(name: 'musical_key')
  String? musicalKey;

  /// Camelot wheel notation of [musicalKey], such as "11A".
  @JsonKey(name: 'camelot_key')
  String? camelotKey;

  factory AudioMetadata.fromJson(Map<String, dynamic> json) => _$AudioMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$AudioMetadataToJson(this);
}

/// Model for a MediaItem's chapter or bookmark.
@JsonSerializable()
class MediaItemChapter {
  MediaItemChapter();

  /// Sort position, starting at 1.
  @JsonKey(name: 'position')
  int? position;

  @JsonKey(name: 'name')
  String? name;

  /// Start position in seconds.
  @JsonKey(name: 'start')
  double? start;

  /// End position in seconds, or null when unknown.
  @JsonKey(name: 'end')
  double? end;

  factory MediaItemChapter.fromJson(Map<String, dynamic> json) => _$MediaItemChapterFromJson(json);
  Map<String, dynamic> toJson() => _$MediaItemChapterToJson(this);
}

/// Model for a MediaItem's metadata.
@JsonSerializable()
class MediaItemMetadata {
  MediaItemMetadata();

  @JsonKey(name: 'description')
  String? description;

  /// ISO 639-1 language code of [description].
  @JsonKey(name: 'description_language')
  String? descriptionLanguage;

  @JsonKey(name: 'review')
  String? review;

  @JsonKey(name: 'explicit')
  bool? explicit;

  /// Available images, most preferred first.
  @JsonKey(name: 'images')
  List<MediaItemImage>? images;

  @JsonKey(name: 'grouping')
  String? grouping;

  @JsonKey(name: 'genres')
  Set<String>? genres;

  @JsonKey(name: 'mood')
  String? mood;

  @JsonKey(name: 'style')
  String? style;

  @JsonKey(name: 'copyright')
  String? copyright;

  @JsonKey(name: 'lyrics')
  String? lyrics;

  @JsonKey(name: 'lrc_lyrics')
  String? lrcLyrics;

  @JsonKey(name: 'transcript')
  String? transcript;

  /// Whether a transcript is available, or null when the provider cannot tell.
  @JsonKey(name: 'has_transcript')
  bool? hasTranscript;

  @JsonKey(name: 'label')
  String? label;

  @JsonKey(name: 'performers')
  Set<String>? performers;

  @JsonKey(name: 'preview')
  String? preview;

  @JsonKey(name: 'popularity')
  int? popularity;

  @JsonKey(name: 'release_date')
  DateTime? releaseDate;

  @JsonKey(name: 'languages')
  List<String>? languages;

  /// Chapters in playback order, such as those of an audiobook.
  @JsonKey(name: 'chapters')
  List<MediaItemChapter>? chapters;

  /// Unix time the full metadata was last collected.
  @JsonKey(name: 'last_refresh')
  int? lastRefresh;

  /// Unix time the item was last looked up on MusicBrainz.
  @JsonKey(name: 'last_musicbrainz_lookup')
  int? lastMusicbrainzLookup;

  factory MediaItemMetadata.fromJson(Map<String, dynamic> json) => _$MediaItemMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MediaItemMetadataToJson(this);
}
