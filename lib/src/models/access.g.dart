// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistAccess _$PlaylistAccessFromJson(Map<String, dynamic> json) => PlaylistAccess()
  ..owner = json['owner'] as String?
  ..sharing = $enumDecodeNullable(_$ProviderSharingEnumMap, json['sharing'], unknownValue: ProviderSharing.private) ??
      ProviderSharing.private
  ..sharedUsers = (json['shared_users'] as List<dynamic>?)?.map((e) => e as String).toList() ?? []
  ..collaborative = json['collaborative'] as bool? ?? false;

Map<String, dynamic> _$PlaylistAccessToJson(PlaylistAccess instance) => <String, dynamic>{
      'owner': instance.owner,
      'sharing': _$ProviderSharingEnumMap[instance.sharing]!,
      'shared_users': instance.sharedUsers,
      'collaborative': instance.collaborative,
    };

const _$ProviderSharingEnumMap = {
  ProviderSharing.private: 'private',
  ProviderSharing.selected: 'selected',
  ProviderSharing.members: 'members',
  ProviderSharing.everyone: 'everyone',
};
