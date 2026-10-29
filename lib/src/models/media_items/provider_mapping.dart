import 'package:json_annotation/json_annotation.dart';

import 'audio_format.dart';

part 'provider_mapping.g.dart';

/// Model for a MediaItem's provider mapping details.
@JsonSerializable()
class ProviderMapping {
  ProviderMapping();

  @JsonKey(name: 'item_id')
  String? itemId;

  @JsonKey(name: 'provider_domain')
  String? providerDomain;

  @JsonKey(name: 'provider_instance')
  String? providerInstance;

  @JsonKey(name: 'available')
  bool available = true;

  /// Whether the item is in the user's library on this provider, or null when unknown.
  @JsonKey(name: 'in_library')
  bool? inLibrary;

  /// Whether this mapping is unique to its provider instance, such as a user upload.
  @JsonKey(name: 'is_unique')
  bool? isUnique;

  @JsonKey(name: 'audio_format')
  AudioFormat? audioFormat;

  /// Link to the item's details page on the provider.
  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'details')
  String? details;

  factory ProviderMapping.fromJson(Map<String, dynamic> json) => _$ProviderMappingFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderMappingToJson(this);
}
