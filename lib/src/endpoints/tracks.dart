import '../client.dart';
import '../models/media_items/media_item.dart';

/// Track related endpoints/commands for Music Assistant.
class TracksEndpoint {
  final MusicAssistantClient _client;

  /// Create a TracksEndpoint instance
  TracksEndpoint(this._client);

  /// Return the number of tracks in the library.
  Future<int> count({bool favoriteOnly = false}) async {
    return await _client.sendCommand('music/tracks/count', args: {'favorite_only': favoriteOnly}) as int;
  }

  /// Return a page of tracks from the library.
  Future<List<Track>> libraryItems({
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
      'music/tracks/library_items',
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
    return result.map((item) => Track.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return a track by id on the given provider.
  Future<Track> get(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/tracks/get',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return Track.fromJson(result as Map<String, dynamic>);
  }
}
