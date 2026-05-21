import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

/// User role enum.
@JsonEnum(valueField: 'value')
enum UserRole {
  admin('admin'),
  user('user'),
  guest('guest');

  const UserRole(this.value);
  final String value;
}

/// Authentication provider type enum.
@JsonEnum(valueField: 'value')
enum AuthProviderType {
  builtin('builtin'),
  homeAssistant('homeassistant');

  const AuthProviderType(this.value);
  final String value;
}

/// User model.
@JsonSerializable()
class User {
  User({required this.userId, required this.username, required this.role});

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'role')
  UserRole role;

  @JsonKey(name: 'enabled')
  bool enabled = true;

  @JsonKey(name: 'created_at')
  DateTime createdAt = DateTime.now();

  @JsonKey(name: 'display_name')
  String? displayName;

  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  @JsonKey(name: 'preferences')
  Map<String, dynamic> preferences = {};

  @JsonKey(name: 'provider_filter')
  List<String> providerFilter = [];

  @JsonKey(name: 'player_filter')
  List<String> playerFilter = [];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/// Link between a User and an Authentication Provider.
@JsonSerializable()
class UserAuthProvider {
  UserAuthProvider({
    required this.linkId,
    required this.userId,
    required this.providerType,
    required this.providerUserId,
  });

  @JsonKey(name: 'link_id')
  String linkId;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'provider_type')
  AuthProviderType providerType;

  @JsonKey(name: 'provider_user_id')
  String providerUserId;

  @JsonKey(name: 'created_at')
  DateTime createdAt = DateTime.now();

  factory UserAuthProvider.fromJson(Map<String, dynamic> json) => _$UserAuthProviderFromJson(json);
  Map<String, dynamic> toJson() => _$UserAuthProviderToJson(this);
}

/// Authentication token model.
@JsonSerializable()
class AuthToken {
  AuthToken({required this.tokenId, required this.userId, required this.tokenHash, required this.name});

  @JsonKey(name: 'token_id')
  String tokenId;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'token_hash')
  String tokenHash;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'created_at')
  DateTime createdAt = DateTime.now();

  @JsonKey(name: 'expires_at')
  DateTime? expiresAt;

  @JsonKey(name: 'last_used_at')
  DateTime? lastUsedAt;

  @JsonKey(name: 'is_long_lived')
  bool isLongLived = false;

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
