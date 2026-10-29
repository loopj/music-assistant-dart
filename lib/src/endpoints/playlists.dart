import '../client.dart';
import '../models/enums.dart';
import '../models/media_items/media_item.dart';

/// Playlist related endpoints/commands for Music Assistant.
class PlaylistsEndpoint {
  final MusicAssistantClient _client;

  /// Create a PlaylistsEndpoint instance
  PlaylistsEndpoint(this._client);

  /// Return the number of playlists in the library.
  Future<int> count({bool favoriteOnly = false}) async {
    return await _client.sendCommand('music/playlists/count', args: {'favorite_only': favoriteOnly}) as int;
  }

  /// Return a page of playlists from the library.
  Future<List<Playlist>> libraryItems({
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
      'music/playlists/library_items',
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
    return result.map((item) => Playlist.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return a playlist by id on the given provider.
  Future<Playlist> get(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/playlists/get',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return Playlist.fromJson(result as Map<String, dynamic>);
  }

  /// Return the items of a playlist, which may mix tracks with other media types.
  Future<List<MediaItemBase>> tracks(
    String itemId,
    String providerInstanceIdOrDomain, {
    bool forceRefresh = false,
  }) async {
    final result = await _client.sendCommand(
      'music/playlists/playlist_tracks',
      args: {
        'item_id': itemId,
        'provider_instance_id_or_domain': providerInstanceIdOrDomain,
        'force_refresh': forceRefresh,
      },
    ) as List<dynamic>;
    return result.map((item) => MediaItemBase.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Create a new playlist on the given provider.
  Future<Playlist> create(String name, {String? providerInstanceOrDomain, Set<MediaType>? mediaTypes}) async {
    final result = await _client.sendCommand(
      'music/playlists/create_playlist',
      args: {
        'name': name,
        'provider_instance_or_domain': providerInstanceOrDomain,
        'media_types': mediaTypes?.map((type) => type.value).toList(),
      },
    );
    return Playlist.fromJson(result as Map<String, dynamic>);
  }

  /// Add items to a library playlist by uri.
  Future<void> addTracks(String dbPlaylistId, List<String> uris) async {
    await _client.sendCommand(
      'music/playlists/add_playlist_tracks',
      args: {'db_playlist_id': dbPlaylistId, 'uris': uris},
    );
  }

  /// Remove items from a library playlist by position.
  Future<void> removeTracks(String dbPlaylistId, List<int> positionsToRemove) async {
    await _client.sendCommand(
      'music/playlists/remove_playlist_tracks',
      args: {'db_playlist_id': dbPlaylistId, 'positions_to_remove': positionsToRemove},
    );
  }
}
