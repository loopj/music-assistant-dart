// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['user_id'] as String,
      username: json['username'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
    )
      ..enabled = json['enabled'] as bool
      ..createdAt = DateTime.parse(json['created_at'] as String)
      ..displayName = json['display_name'] as String?
      ..avatarUrl = json['avatar_url'] as String?
      ..preferences = json['preferences'] as Map<String, dynamic>
      ..providerFilter = (json['provider_filter'] as List<dynamic>).map((e) => e as String).toList()
      ..playerFilter = (json['player_filter'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'role': _$UserRoleEnumMap[instance.role]!,
      'enabled': instance.enabled,
      'created_at': instance.createdAt.toIso8601String(),
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'preferences': instance.preferences,
      'provider_filter': instance.providerFilter,
      'player_filter': instance.playerFilter,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.user: 'user',
  UserRole.guest: 'guest',
};

UserAuthProvider _$UserAuthProviderFromJson(Map<String, dynamic> json) => UserAuthProvider(
      linkId: json['link_id'] as String,
      userId: json['user_id'] as String,
      providerType: $enumDecode(_$AuthProviderTypeEnumMap, json['provider_type']),
      providerUserId: json['provider_user_id'] as String,
    )..createdAt = DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$UserAuthProviderToJson(UserAuthProvider instance) => <String, dynamic>{
      'link_id': instance.linkId,
      'user_id': instance.userId,
      'provider_type': _$AuthProviderTypeEnumMap[instance.providerType]!,
      'provider_user_id': instance.providerUserId,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$AuthProviderTypeEnumMap = {
  AuthProviderType.builtin: 'builtin',
  AuthProviderType.homeAssistant: 'homeassistant',
};

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
      tokenId: json['token_id'] as String,
      userId: json['user_id'] as String,
      tokenHash: json['token_hash'] as String,
      name: json['name'] as String,
    )
      ..createdAt = DateTime.parse(json['created_at'] as String)
      ..expiresAt = json['expires_at'] == null ? null : DateTime.parse(json['expires_at'] as String)
      ..lastUsedAt = json['last_used_at'] == null ? null : DateTime.parse(json['last_used_at'] as String)
      ..isLongLived = json['is_long_lived'] as bool;

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'token_id': instance.tokenId,
      'user_id': instance.userId,
      'token_hash': instance.tokenHash,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'last_used_at': instance.lastUsedAt?.toIso8601String(),
      'is_long_lived': instance.isLongLived,
    };
