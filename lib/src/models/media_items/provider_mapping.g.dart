// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderMapping _$ProviderMappingFromJson(Map<String, dynamic> json) => ProviderMapping()
  ..itemId = json['item_id'] as String?
  ..providerDomain = json['provider_domain'] as String?
  ..providerInstance = json['provider_instance'] as String?
  ..available = json['available'] as bool? ?? true
  ..inLibrary = json['in_library'] as bool?
  ..isUnique = json['is_unique'] as bool?
  ..audioFormat =
      json['audio_format'] == null ? null : AudioFormat.fromJson(json['audio_format'] as Map<String, dynamic>)
  ..url = json['url'] as String?
  ..details = json['details'] as String?;

Map<String, dynamic> _$ProviderMappingToJson(ProviderMapping instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'provider_domain': instance.providerDomain,
      'provider_instance': instance.providerInstance,
      'available': instance.available,
      'in_library': instance.inLibrary,
      'is_unique': instance.isUnique,
      'audio_format': instance.audioFormat,
      'url': instance.url,
      'details': instance.details,
    };
