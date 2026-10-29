import '../client.dart';
import '../models/media_items/media_item.dart';

/// Artist related endpoints/commands for Music Assistant.
class ArtistsEndpoint {
  final MusicAssistantClient _client;

  /// Create an ArtistsEndpoint instance
  ArtistsEndpoint(this._client);

  /// Return the number of artists in the library.
  Future<int> count({bool favoriteOnly = false}) async {
    return await _client.sendCommand('music/artists/count', args: {'favorite_only': favoriteOnly}) as int;
  }

  /// Return a page of artists from the library.
  Future<List<Artist>> libraryItems({
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
      'music/artists/library_items',
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
    return result.map((item) => Artist.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return an artist by id on the given provider.
  Future<Artist> get(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/artists/get',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return Artist.fromJson(result as Map<String, dynamic>);
  }

  /// Return the albums of an artist.
  Future<List<Album>> albums(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/artists/artist_albums',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    ) as List<dynamic>;
    return result.map((item) => Album.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return the tracks of an artist.
  Future<List<Track>> tracks(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/artists/artist_tracks',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    ) as List<dynamic>;
    return result.map((item) => Track.fromJson(item as Map<String, dynamic>)).toList();
  }
}
