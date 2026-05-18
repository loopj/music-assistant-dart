import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  Player();

  String? playerId;
  String? provider;
  String? type;
  String? name;
  bool? available;
  Map<String, dynamic>? deviceInfo;
  Set<String>? supportedFeatures;
  String? playbackState;
  double? elapsedTime;
  double? elapsedTimeLastUpdated;
  bool? powered;
  int? volumeLevel;
  bool? volumeMuted;

  factory Player.fromJson(Map<String, dynamic> input) => _$PlayerFromJson(input);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
