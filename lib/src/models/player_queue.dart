import 'package:json_annotation/json_annotation.dart';

part 'player_queue.g.dart';

@JsonSerializable()
class PlayerQueue {
  PlayerQueue();

  @JsonKey(name: 'queue_id')
  String? queueId;

  factory PlayerQueue.fromJson(Map<String, dynamic> input) => _$PlayerQueueFromJson(input);
  Map<String, dynamic> toJson() => _$PlayerQueueToJson(this);
}
