import '../client.dart';
import '../models/media_items/media_item.dart';

/// Genre related endpoints/commands for Music Assistant.
class GenresEndpoint {
  final MusicAssistantClient _client;

  /// Create a GenresEndpoint instance
  GenresEndpoint(this._client);

  /// Return the number of genres in the library.
  Future<int> count({bool favoriteOnly = false}) async {
    return await _client.sendCommand('music/genres/count', args: {'favorite_only': favoriteOnly}) as int;
  }

  /// Return a page of genres from the library.
  Future<List<Genre>> libraryItems({bool? favorite, String? search, int? limit, int? offset, String? orderBy}) async {
    // Leave unset filters out so the server applies its own defaults
    final result = await _client.sendCommand(
      'music/genres/library_items',
      args: {
        if (favorite != null) 'favorite': favorite,
        if (search != null) 'search': search,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
        if (orderBy != null) 'order_by': orderBy,
      },
    ) as List<dynamic>;
    return result.map((item) => Genre.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return a genre by id on the given provider.
  Future<Genre> get(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/genres/get',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return Genre.fromJson(result as Map<String, dynamic>);
  }

  /// Return a page of the library tracks in a genre.
  Future<List<Track>> tracks(String itemId, {int? limit, int? offset, String? orderBy}) async {
    // Leave unset paging out so the server applies its own defaults
    final result = await _client.sendCommand(
      'music/genres/tracks',
      args: {
        'item_id': itemId,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
        if (orderBy != null) 'order_by': orderBy,
      },
    ) as List<dynamic>;
    return result.map((item) => Track.fromJson(item as Map<String, dynamic>)).toList();
  }
}
