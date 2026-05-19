import 'package:json_annotation/json_annotation.dart';

import './enums.dart';

part 'api.g.dart';

/// Message sent by the server with it's info when a client connects.
@JsonSerializable()
class ServerInfoMessage {
  ServerInfoMessage();

  @JsonKey(name: 'server_id')
  String serverId = '';

  @JsonKey(name: 'server_version')
  String serverVersion = '';

  @JsonKey(name: 'schema_version')
  int schemaVersion = 0;

  @JsonKey(name: 'min_supported_schema_version')
  int minSupportedSchemaVersion = 0;

  @JsonKey(name: 'base_url')
  String baseUrl = '';

  @JsonKey(name: 'homeassistant_addon')
  bool homeassistantAddon = false;

  @JsonKey(name: 'onboard_done')
  bool onboardDone = false;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'status')
  CoreState status = CoreState.running;

  factory ServerInfoMessage.fromJson(Map<String, dynamic> json) => _$ServerInfoMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ServerInfoMessageToJson(this);
}
