import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  Player();

  @JsonKey(name: 'player_id')
  String? playerId;
  String? provider;
  String? type;
  String? name;
  bool? available;
  @JsonKey(name: 'device_info')
  Map<String, dynamic>? deviceInfo;
  @JsonKey(name: 'supported_features')
  Set<String>? supportedFeatures;
  @JsonKey(name: 'playback_state')
  String? playbackState;
  @JsonKey(name: 'elapsed_time')
  double? elapsedTime;
  @JsonKey(name: 'elapsed_time_last_updated')
  double? elapsedTimeLastUpdated;
  bool? powered;
  @JsonKey(name: 'volume_level')
  int? volumeLevel;
  @JsonKey(name: 'volume_muted')
  bool? volumeMuted;

  factory Player.fromJson(Map<String, dynamic> input) => _$PlayerFromJson(input);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
