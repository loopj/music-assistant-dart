import 'package:json_annotation/json_annotation.dart';

import './enums.dart';

part 'player.g.dart';

/// Represents an output protocol for a player.
@JsonSerializable()
class OutputProtocol {
  OutputProtocol();

  @JsonKey(name: 'output_protocol_id')
  String? outputProtocolId;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'protocol_domain')
  String? protocolDomain;

  @JsonKey(name: 'is_native')
  bool isNative = false;

  @JsonKey(name: 'priority')
  int priority = 100;

  @JsonKey(name: 'available')
  bool available = true;

  factory OutputProtocol.fromJson(Map<String, dynamic> json) => _$OutputProtocolFromJson(json);
  Map<String, dynamic> toJson() => _$OutputProtocolToJson(this);
}

/// Model for a player's device info.
@JsonSerializable()
class DeviceInfo {
  DeviceInfo();

  @JsonKey(name: 'model')
  String model = 'Unknown model';

  @JsonKey(name: 'manufacturer')
  String manufacturer = 'Unknown Manufacturer';

  @JsonKey(name: 'software_version')
  String? softwareVersion;

  @JsonKey(name: 'model_id')
  String? modelId;

  @JsonKey(name: 'manufacturer_id')
  String? manufacturerId;

  @JsonKey(name: 'identifiers')
  Map<IdentifierType, String> identifiers = {};

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => _$DeviceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);
}

/// Metadata of Media loading/loaded into a player.
@JsonSerializable()
class PlayerMedia {
  PlayerMedia();

  @JsonKey(name: 'uri')
  String? uri;

  @JsonKey(name: 'media_type')
  MediaType mediaType = MediaType.unknown;

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

  @JsonKey(name: 'source_id')
  String? sourceId;

  @JsonKey(name: 'queue_item_id')
  String? queueItemId;

  @JsonKey(name: 'custom_data')
  Map<String, dynamic>? customData;

  @JsonKey(name: 'elapsed_time')
  int? elapsedTime;

  @JsonKey(name: 'elapsed_time_last_updated')
  double? elapsedTimeLastUpdated;

  factory PlayerMedia.fromJson(Map<String, dynamic> json) => _$PlayerMediaFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerMediaToJson(this);
}

/// Model for a player source.
@JsonSerializable()
class PlayerSource {
  PlayerSource();

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'passive')
  bool passive = false;

  @JsonKey(name: 'can_play_pause')
  bool canPlayPause = false;

  @JsonKey(name: 'can_seek')
  bool canSeek = false;

  @JsonKey(name: 'can_next_previous')
  bool canNextPrevious = false;

  factory PlayerSource.fromJson(Map<String, dynamic> json) => _$PlayerSourceFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerSourceToJson(this);
}

/// Model for a player sound mode.
@JsonSerializable()
class PlayerSoundMode {
  PlayerSoundMode();

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'passive')
  bool passive = false;

  @JsonKey(name: 'translation_key')
  String translationKey = '';

  factory PlayerSoundMode.fromJson(Map<String, dynamic> json) => _$PlayerSoundModeFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerSoundModeToJson(this);
}

/// Enum for the type of a Player Option.
@JsonEnum(valueField: 'value')
enum PlayerOptionType {
  boolean('boolean'),
  integer('integer'),
  float('float'),
  string('string');

  const PlayerOptionType(this.value);
  final String value;
}

/// A single choice.
@JsonSerializable()
class PlayerOptionEntry {
  PlayerOptionEntry();

  @JsonKey(name: 'key')
  String? key;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'type')
  PlayerOptionType? type;

  @JsonKey(name: 'value')
  dynamic value;

  @JsonKey(name: 'translation_key')
  String translationKey = '';

  factory PlayerOptionEntry.fromJson(Map<String, dynamic> json) => _$PlayerOptionEntryFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerOptionEntryToJson(this);
}

/// Model for a PlayerOption.
@JsonSerializable()
class PlayerOption {
  PlayerOption();

  @JsonKey(name: 'key')
  String? key;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'type')
  PlayerOptionType? type;

  @JsonKey(name: 'translation_key')
  String translationKey = '';

  @JsonKey(name: 'translation_params')
  List<String>? translationParams;

  @JsonKey(name: 'value')
  dynamic value;

  @JsonKey(name: 'read_only')
  bool readOnly = false;

  @JsonKey(name: 'min_value')
  num? minValue;

  @JsonKey(name: 'max_value')
  num? maxValue;

  @JsonKey(name: 'step')
  num? step;

  @JsonKey(name: 'options')
  List<PlayerOptionEntry>? options;

  factory PlayerOption.fromJson(Map<String, dynamic> json) => _$PlayerOptionFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerOptionToJson(this);
}

/// Representation of (the state of) a player within Music Assistant.
@JsonSerializable()
class Player {
  Player();

  @JsonKey(name: 'player_id')
  String? playerId;

  @JsonKey(name: 'provider')
  String? provider;

  @JsonKey(name: 'type')
  String? type;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'available')
  bool? available;

  @JsonKey(name: 'device_info')
  DeviceInfo? deviceInfo;

  @JsonKey(name: 'supported_features')
  Set<PlayerFeature> supportedFeatures = {};

  @JsonKey(name: 'playback_state')
  PlaybackState playbackState = PlaybackState.idle;

  @JsonKey(name: 'elapsed_time')
  double? elapsedTime;

  @JsonKey(name: 'elapsed_time_last_updated')
  double? elapsedTimeLastUpdated;

  @JsonKey(name: 'powered')
  bool? powered;

  @JsonKey(name: 'volume_level')
  int? volumeLevel;

  @JsonKey(name: 'volume_muted')
  bool? volumeMuted;

  @JsonKey(name: 'group_members')
  List<String> groupMembers = [];

  @JsonKey(name: 'static_group_members')
  List<String> staticGroupMembers = [];

  @JsonKey(name: 'can_group_with')
  Set<String> canGroupWith = {};

  @JsonKey(name: 'synced_to')
  String? syncedTo;

  @JsonKey(name: 'active_sound_mode')
  String? activeSoundMode;

  @JsonKey(name: 'sound_mode_list')
  List<PlayerSoundMode> soundModeList = [];

  @JsonKey(name: 'options')
  List<PlayerOption> options = [];

  @JsonKey(name: 'active_source')
  String? activeSource;

  @JsonKey(name: 'source_list')
  List<PlayerSource> sourceList = [];

  @JsonKey(name: 'active_group')
  String? activeGroup;

  @JsonKey(name: 'current_media')
  PlayerMedia? currentMedia;

  @JsonKey(name: 'enabled')
  bool enabled = true;

  @JsonKey(name: 'hide_in_ui')
  bool hideInUi = false;

  @JsonKey(name: 'expose_to_ha')
  bool exposeToHa = true;

  @JsonKey(name: 'icon')
  String icon = 'mdi-speaker';

  @JsonKey(name: 'group_volume')
  int? groupVolume;

  @JsonKey(name: 'group_volume_muted')
  bool? groupVolumeMuted;

  @JsonKey(name: 'extra_attributes')
  Map<String, dynamic> extraAttributes = {};

  @JsonKey(name: 'power_control')
  String powerControl = 'none';

  @JsonKey(name: 'volume_control')
  String volumeControl = 'none';

  @JsonKey(name: 'mute_control')
  String muteControl = 'none';

  @JsonKey(name: 'output_protocols')
  List<OutputProtocol> outputProtocols = [];

  @JsonKey(name: 'active_output_protocol')
  String? activeOutputProtocol;

  @JsonKey(name: 'needs_setup')
  bool needsSetup = false;

  factory Player.fromJson(Map<String, dynamic> input) => _$PlayerFromJson(input);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
