import '../client.dart';
import '../models/media_items/media_item.dart';

/// Album related endpoints/commands for Music Assistant.
class AlbumsEndpoint {
  final MusicAssistantClient _client;

  /// Create an AlbumsEndpoint instance
  AlbumsEndpoint(this._client);

  /// Return the number of albums in the library.
  Future<int> count({bool favoriteOnly = false}) async {
    return await _client.sendCommand('music/albums/count', args: {'favorite_only': favoriteOnly}) as int;
  }

  /// Return a page of albums from the library.
  Future<List<Album>> libraryItems({
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
      'music/albums/library_items',
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
    return result.map((item) => Album.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return an album by id on the given provider.
  Future<Album> get(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/albums/get',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return Album.fromJson(result as Map<String, dynamic>);
  }

  /// Return the tracks of an album.
  Future<List<Track>> tracks(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/albums/album_tracks',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    ) as List<dynamic>;
    return result.map((item) => Track.fromJson(item as Map<String, dynamic>)).toList();
  }
}
