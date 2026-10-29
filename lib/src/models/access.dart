import 'package:json_annotation/json_annotation.dart';

import 'enums.dart';

part 'access.g.dart';

/// Who owns a Music Assistant playlist, and who may see and edit it.
@JsonSerializable()
class PlaylistAccess {
  PlaylistAccess();

  /// User id of the owner, or null when an admin manages it.
  @JsonKey(name: 'owner')
  String? owner;

  @JsonKey(name: 'sharing')
  ProviderSharing sharing = ProviderSharing.private;

  /// Users the playlist is shared with, used only with [ProviderSharing.selected].
  @JsonKey(name: 'shared_users')
  List<String> sharedUsers = [];

  /// Whether everyone the playlist is shared with may also add and remove its items.
  @JsonKey(name: 'collaborative')
  bool collaborative = false;

  factory PlaylistAccess.fromJson(Map<String, dynamic> json) => _$PlaylistAccessFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistAccessToJson(this);
}
