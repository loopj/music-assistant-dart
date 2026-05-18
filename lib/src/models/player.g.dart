// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player()
  ..playerId = json['playerId'] as String?
  ..provider = json['provider'] as String?
  ..type = json['type'] as String?
  ..name = json['name'] as String?
  ..available = json['available'] as bool?
  ..deviceInfo = json['deviceInfo'] as Map<String, dynamic>?
  ..supportedFeatures = (json['supportedFeatures'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toSet()
  ..playbackState = json['playbackState'] as String?
  ..elapsedTime = (json['elapsedTime'] as num?)?.toDouble()
  ..elapsedTimeLastUpdated =
      (json['elapsedTimeLastUpdated'] as num?)?.toDouble()
  ..powered = json['powered'] as bool?
  ..volumeLevel = (json['volumeLevel'] as num?)?.toInt()
  ..volumeMuted = json['volumeMuted'] as bool?;

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'playerId': instance.playerId,
      'provider': instance.provider,
      'type': instance.type,
      'name': instance.name,
      'available': instance.available,
      'deviceInfo': instance.deviceInfo,
      'supportedFeatures': instance.supportedFeatures?.toList(),
      'playbackState': instance.playbackState,
      'elapsedTime': instance.elapsedTime,
      'elapsedTimeLastUpdated': instance.elapsedTimeLastUpdated,
      'powered': instance.powered,
      'volumeLevel': instance.volumeLevel,
      'volumeMuted': instance.volumeMuted,
    };
