import 'package:json_annotation/json_annotation.dart';

import './enums.dart';

part 'api.g.dart';

/// Message sent by the server with it's info when a client connects.
@JsonSerializable()
class ServerInfoMessage {
  ServerInfoMessage();

  @JsonKey(name: 'server_id', defaultValue: '')
  String serverId = '';

  @JsonKey(name: 'server_version', defaultValue: '')
  String serverVersion = '';

  @JsonKey(name: 'schema_version', defaultValue: 0)
  int schemaVersion = 0;

  @JsonKey(name: 'min_supported_schema_version', defaultValue: 0)
  int minSupportedSchemaVersion = 0;

  @JsonKey(name: 'base_url', defaultValue: '')
  String baseUrl = '';

  @JsonKey(name: 'homeassistant_addon', defaultValue: false)
  bool homeassistantAddon = false;

  @JsonKey(name: 'onboard_done', defaultValue: false)
  bool onboardDone = false;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'status', unknownEnumValue: CoreState.unknown, defaultValue: CoreState.running)
  CoreState status = CoreState.running;

  factory ServerInfoMessage.fromJson(Map<String, dynamic> json) => _$ServerInfoMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ServerInfoMessageToJson(this);
}
