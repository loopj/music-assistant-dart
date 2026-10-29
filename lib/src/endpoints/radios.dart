import '../client.dart';
import '../models/media_items/media_item.dart';

/// Radio related endpoints/commands for Music Assistant.
class RadiosEndpoint {
  final MusicAssistantClient _client;

  /// Create a RadiosEndpoint instance
  RadiosEndpoint(this._client);

  /// Return the number of radio stations in the library.
  Future<int> count({bool favoriteOnly = false}) async {
    return await _client.sendCommand('music/radios/count', args: {'favorite_only': favoriteOnly}) as int;
  }

  /// Return a page of radio stations from the library.
  Future<List<Radio>> libraryItems({
    bool? favorite,
    String? search,
    int? limit,
    int? offset,
    String? orderBy,
    String? provider,
    String? genre,
  }) async {
    // Leave unset filters out so the server applies its own defaults
    final result = await _client.sendCommand(
      'music/radios/library_items',
      args: {
        if (favorite != null) 'favorite': favorite,
        if (search != null) 'search': search,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
        if (orderBy != null) 'order_by': orderBy,
        if (provider != null) 'provider': provider,
        if (genre != null) 'genre': genre,
      },
    ) as List<dynamic>;
    return result.map((item) => Radio.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return a radio station by id on the given provider.
  Future<Radio> get(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/radios/get',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return Radio.fromJson(result as Map<String, dynamic>);
  }
}
