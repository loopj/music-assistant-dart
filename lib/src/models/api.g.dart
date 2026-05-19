// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerInfoMessage _$ServerInfoMessageFromJson(Map<String, dynamic> json) => ServerInfoMessage()
  ..serverId = json['server_id'] as String
  ..serverVersion = json['server_version'] as String
  ..schemaVersion = (json['schema_version'] as num).toInt()
  ..minSupportedSchemaVersion = (json['min_supported_schema_version'] as num).toInt()
  ..baseUrl = json['base_url'] as String
  ..homeassistantAddon = json['homeassistant_addon'] as bool
  ..onboardDone = json['onboard_done'] as bool
  ..name = json['name'] as String?
  ..status = $enumDecode(_$CoreStateEnumMap, json['status']);

Map<String, dynamic> _$ServerInfoMessageToJson(ServerInfoMessage instance) => <String, dynamic>{
  'server_id': instance.serverId,
  'server_version': instance.serverVersion,
  'schema_version': instance.schemaVersion,
  'min_supported_schema_version': instance.minSupportedSchemaVersion,
  'base_url': instance.baseUrl,
  'homeassistant_addon': instance.homeassistantAddon,
  'onboard_done': instance.onboardDone,
  'name': instance.name,
  'status': _$CoreStateEnumMap[instance.status]!,
};

const _$CoreStateEnumMap = {
  CoreState.starting: 'starting',
  CoreState.running: 'running',
  CoreState.stopping: 'stopping',
  CoreState.stopped: 'stopped',
};
