// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputProtocol _$OutputProtocolFromJson(Map<String, dynamic> json) => OutputProtocol()
  ..outputProtocolId = json['output_protocol_id'] as String?
  ..name = json['name'] as String?
  ..protocolDomain = json['protocol_domain'] as String?
  ..isNative = json['is_native'] as bool
  ..priority = (json['priority'] as num).toInt()
  ..available = json['available'] as bool;

Map<String, dynamic> _$OutputProtocolToJson(OutputProtocol instance) => <String, dynamic>{
  'output_protocol_id': instance.outputProtocolId,
  'name': instance.name,
  'protocol_domain': instance.protocolDomain,
  'is_native': instance.isNative,
  'priority': instance.priority,
  'available': instance.available,
};

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) => DeviceInfo()
  ..model = json['model'] as String
  ..manufacturer = json['manufacturer'] as String
  ..softwareVersion = json['software_version'] as String?
  ..modelId = json['model_id'] as String?
  ..manufacturerId = json['manufacturer_id'] as String?
  ..identifiers = (json['identifiers'] as Map<String, dynamic>).map(
    (k, e) => MapEntry($enumDecode(_$IdentifierTypeEnumMap, k), e as String),
  );

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) => <String, dynamic>{
  'model': instance.model,
  'manufacturer': instance.manufacturer,
  'software_version': instance.softwareVersion,
  'model_id': instance.modelId,
  'manufacturer_id': instance.manufacturerId,
  'identifiers': instance.identifiers.map((k, e) => MapEntry(_$IdentifierTypeEnumMap[k]!, e)),
};

const _$IdentifierTypeEnumMap = {
  IdentifierType.macAddress: 'mac_address',
  IdentifierType.serialNumber: 'serial_number',
  IdentifierType.uuid: 'uuid',
  IdentifierType.castUuid: 'cast_uuid',
  IdentifierType.airplayId: 'airplay_id',
  IdentifierType.ipAddress: 'ip_address',
  IdentifierType.unknown: 'unknown',
};

PlayerMedia _$PlayerMediaFromJson(Map<String, dynamic> json) => PlayerMedia()
  ..uri = json['uri'] as String?
  ..mediaType = $enumDecode(_$MediaTypeEnumMap, json['media_type'])
  ..title = json['title'] as String?
  ..artist = json['artist'] as String?
  ..album = json['album'] as String?
  ..imageUrl = json['image_url'] as String?
  ..duration = (json['duration'] as num?)?.toInt()
  ..sourceId = json['source_id'] as String?
  ..queueItemId = json['queue_item_id'] as String?
  ..customData = json['custom_data'] as Map<String, dynamic>?
  ..elapsedTime = (json['elapsed_time'] as num?)?.toInt()
  ..elapsedTimeLastUpdated = (json['elapsed_time_last_updated'] as num?)?.toDouble();

Map<String, dynamic> _$PlayerMediaToJson(PlayerMedia instance) => <String, dynamic>{
  'uri': instance.uri,
  'media_type': _$MediaTypeEnumMap[instance.mediaType]!,
  'title': instance.title,
  'artist': instance.artist,
  'album': instance.album,
  'image_url': instance.imageUrl,
  'duration': instance.duration,
  'source_id': instance.sourceId,
  'queue_item_id': instance.queueItemId,
  'custom_data': instance.customData,
  'elapsed_time': instance.elapsedTime,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
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

PlayerSource _$PlayerSourceFromJson(Map<String, dynamic> json) => PlayerSource()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..passive = json['passive'] as bool
  ..canPlayPause = json['can_play_pause'] as bool
  ..canSeek = json['can_seek'] as bool
  ..canNextPrevious = json['can_next_previous'] as bool;

Map<String, dynamic> _$PlayerSourceToJson(PlayerSource instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'passive': instance.passive,
  'can_play_pause': instance.canPlayPause,
  'can_seek': instance.canSeek,
  'can_next_previous': instance.canNextPrevious,
};

PlayerSoundMode _$PlayerSoundModeFromJson(Map<String, dynamic> json) => PlayerSoundMode()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..passive = json['passive'] as bool
  ..translationKey = json['translation_key'] as String;

Map<String, dynamic> _$PlayerSoundModeToJson(PlayerSoundMode instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'passive': instance.passive,
  'translation_key': instance.translationKey,
};

PlayerOptionEntry _$PlayerOptionEntryFromJson(Map<String, dynamic> json) => PlayerOptionEntry()
  ..key = json['key'] as String?
  ..name = json['name'] as String?
  ..type = $enumDecodeNullable(_$PlayerOptionTypeEnumMap, json['type'])
  ..value = json['value']
  ..translationKey = json['translation_key'] as String;

Map<String, dynamic> _$PlayerOptionEntryToJson(PlayerOptionEntry instance) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'type': _$PlayerOptionTypeEnumMap[instance.type],
  'value': instance.value,
  'translation_key': instance.translationKey,
};

const _$PlayerOptionTypeEnumMap = {
  PlayerOptionType.boolean: 'boolean',
  PlayerOptionType.integer: 'integer',
  PlayerOptionType.float: 'float',
  PlayerOptionType.string: 'string',
};

PlayerOption _$PlayerOptionFromJson(Map<String, dynamic> json) => PlayerOption()
  ..key = json['key'] as String?
  ..name = json['name'] as String?
  ..type = $enumDecodeNullable(_$PlayerOptionTypeEnumMap, json['type'])
  ..translationKey = json['translation_key'] as String
  ..translationParams = (json['translation_params'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..value = json['value']
  ..readOnly = json['read_only'] as bool
  ..minValue = json['min_value'] as num?
  ..maxValue = json['max_value'] as num?
  ..step = json['step'] as num?
  ..options = (json['options'] as List<dynamic>?)
      ?.map((e) => PlayerOptionEntry.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PlayerOptionToJson(PlayerOption instance) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'type': _$PlayerOptionTypeEnumMap[instance.type],
  'translation_key': instance.translationKey,
  'translation_params': instance.translationParams,
  'value': instance.value,
  'read_only': instance.readOnly,
  'min_value': instance.minValue,
  'max_value': instance.maxValue,
  'step': instance.step,
  'options': instance.options,
};

Player _$PlayerFromJson(Map<String, dynamic> json) => Player()
  ..playerId = json['player_id'] as String?
  ..provider = json['provider'] as String?
  ..type = json['type'] as String?
  ..name = json['name'] as String?
  ..available = json['available'] as bool?
  ..deviceInfo = json['device_info'] == null ? null : DeviceInfo.fromJson(json['device_info'] as Map<String, dynamic>)
  ..supportedFeatures = (json['supported_features'] as List<dynamic>)
      .map((e) => $enumDecode(_$PlayerFeatureEnumMap, e))
      .toSet()
  ..playbackState = $enumDecode(_$PlaybackStateEnumMap, json['playback_state'])
  ..elapsedTime = (json['elapsed_time'] as num?)?.toDouble()
  ..elapsedTimeLastUpdated = (json['elapsed_time_last_updated'] as num?)?.toDouble()
  ..powered = json['powered'] as bool?
  ..volumeLevel = (json['volume_level'] as num?)?.toInt()
  ..volumeMuted = json['volume_muted'] as bool?
  ..groupMembers = (json['group_members'] as List<dynamic>).map((e) => e as String).toList()
  ..staticGroupMembers = (json['static_group_members'] as List<dynamic>).map((e) => e as String).toList()
  ..canGroupWith = (json['can_group_with'] as List<dynamic>).map((e) => e as String).toSet()
  ..syncedTo = json['synced_to'] as String?
  ..activeSoundMode = json['active_sound_mode'] as String?
  ..soundModeList = (json['sound_mode_list'] as List<dynamic>)
      .map((e) => PlayerSoundMode.fromJson(e as Map<String, dynamic>))
      .toList()
  ..options = (json['options'] as List<dynamic>).map((e) => PlayerOption.fromJson(e as Map<String, dynamic>)).toList()
  ..activeSource = json['active_source'] as String?
  ..sourceList = (json['source_list'] as List<dynamic>)
      .map((e) => PlayerSource.fromJson(e as Map<String, dynamic>))
      .toList()
  ..activeGroup = json['active_group'] as String?
  ..currentMedia = json['current_media'] == null
      ? null
      : PlayerMedia.fromJson(json['current_media'] as Map<String, dynamic>)
  ..enabled = json['enabled'] as bool
  ..hideInUi = json['hide_in_ui'] as bool
  ..exposeToHa = json['expose_to_ha'] as bool
  ..icon = json['icon'] as String
  ..groupVolume = (json['group_volume'] as num?)?.toInt()
  ..groupVolumeMuted = json['group_volume_muted'] as bool?
  ..extraAttributes = json['extra_attributes'] as Map<String, dynamic>
  ..powerControl = json['power_control'] as String
  ..volumeControl = json['volume_control'] as String
  ..muteControl = json['mute_control'] as String
  ..outputProtocols = (json['output_protocols'] as List<dynamic>)
      .map((e) => OutputProtocol.fromJson(e as Map<String, dynamic>))
      .toList()
  ..activeOutputProtocol = json['active_output_protocol'] as String?
  ..needsSetup = json['needs_setup'] as bool;

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
  'player_id': instance.playerId,
  'provider': instance.provider,
  'type': instance.type,
  'name': instance.name,
  'available': instance.available,
  'device_info': instance.deviceInfo,
  'supported_features': instance.supportedFeatures.map((e) => _$PlayerFeatureEnumMap[e]!).toList(),
  'playback_state': _$PlaybackStateEnumMap[instance.playbackState]!,
  'elapsed_time': instance.elapsedTime,
  'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
  'powered': instance.powered,
  'volume_level': instance.volumeLevel,
  'volume_muted': instance.volumeMuted,
  'group_members': instance.groupMembers,
  'static_group_members': instance.staticGroupMembers,
  'can_group_with': instance.canGroupWith.toList(),
  'synced_to': instance.syncedTo,
  'active_sound_mode': instance.activeSoundMode,
  'sound_mode_list': instance.soundModeList,
  'options': instance.options,
  'active_source': instance.activeSource,
  'source_list': instance.sourceList,
  'active_group': instance.activeGroup,
  'current_media': instance.currentMedia,
  'enabled': instance.enabled,
  'hide_in_ui': instance.hideInUi,
  'expose_to_ha': instance.exposeToHa,
  'icon': instance.icon,
  'group_volume': instance.groupVolume,
  'group_volume_muted': instance.groupVolumeMuted,
  'extra_attributes': instance.extraAttributes,
  'power_control': instance.powerControl,
  'volume_control': instance.volumeControl,
  'mute_control': instance.muteControl,
  'output_protocols': instance.outputProtocols,
  'active_output_protocol': instance.activeOutputProtocol,
  'needs_setup': instance.needsSetup,
};

const _$PlayerFeatureEnumMap = {
  PlayerFeature.power: 'power',
  PlayerFeature.volumeSet: 'volume_set',
  PlayerFeature.volumeMute: 'volume_mute',
  PlayerFeature.pause: 'pause',
  PlayerFeature.setMembers: 'set_members',
  PlayerFeature.multiDeviceDsp: 'multi_device_dsp',
  PlayerFeature.seek: 'seek',
  PlayerFeature.nextPrevious: 'next_previous',
  PlayerFeature.playAnnouncement: 'play_announcement',
  PlayerFeature.enqueue: 'enqueue',
  PlayerFeature.selectSoundMode: 'select_sound_mode',
  PlayerFeature.selectSource: 'select_source',
  PlayerFeature.options: 'options',
  PlayerFeature.gaplessPlayback: 'gapless_playback',
  PlayerFeature.gaplessDifferentSamplerate: 'gapless_different_samplerate',
  PlayerFeature.playMedia: 'play_media',
  PlayerFeature.unknown: 'unknown',
};

const _$PlaybackStateEnumMap = {
  PlaybackState.idle: 'idle',
  PlaybackState.paused: 'paused',
  PlaybackState.playing: 'playing',
  PlaybackState.unknown: 'unknown',
};
