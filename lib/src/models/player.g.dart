// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player()
  ..playerId = json['player_id'] as String?
  ..provider = json['provider'] as String?
  ..type = json['type'] as String?
  ..name = json['name'] as String?
  ..available = json['available'] as bool?
  ..deviceInfo = json['device_info'] as Map<String, dynamic>?
  ..supportedFeatures = (json['supported_features'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toSet()
  ..playbackState = json['playback_state'] as String?
  ..elapsedTime = (json['elapsed_time'] as num?)?.toDouble()
  ..elapsedTimeLastUpdated =
      (json['elapsed_time_last_updated'] as num?)?.toDouble()
  ..powered = json['powered'] as bool?
  ..volumeLevel = (json['volume_level'] as num?)?.toInt()
  ..volumeMuted = json['volume_muted'] as bool?;

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'player_id': instance.playerId,
      'provider': instance.provider,
      'type': instance.type,
      'name': instance.name,
      'available': instance.available,
      'device_info': instance.deviceInfo,
      'supported_features': instance.supportedFeatures?.toList(),
      'playback_state': instance.playbackState,
      'elapsed_time': instance.elapsedTime,
      'elapsed_time_last_updated': instance.elapsedTimeLastUpdated,
      'powered': instance.powered,
      'volume_level': instance.volumeLevel,
      'volume_muted': instance.volumeMuted,
    };
