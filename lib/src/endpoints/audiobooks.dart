import '../client.dart';
import '../models/media_items/media_item.dart';

/// Audiobook related endpoints/commands for Music Assistant.
class AudiobooksEndpoint {
  final MusicAssistantClient _client;

  /// Create an AudiobooksEndpoint instance
  AudiobooksEndpoint(this._client);

  /// Return the number of audiobooks in the library.
  Future<int> count({bool favoriteOnly = false}) async {
    return await _client.sendCommand('music/audiobooks/count', args: {'favorite_only': favoriteOnly}) as int;
  }

  /// Return a page of audiobooks from the library.
  Future<List<Audiobook>> libraryItems({
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
      'music/audiobooks/library_items',
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
    return result.map((item) => Audiobook.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return an audiobook with its chapters by id on the given provider.
  Future<Audiobook> get(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/audiobooks/get',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return Audiobook.fromJson(result as Map<String, dynamic>);
  }
}
