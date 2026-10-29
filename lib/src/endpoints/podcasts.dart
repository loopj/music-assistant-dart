import '../client.dart';
import '../models/media_items/media_item.dart';

/// Podcast related endpoints/commands for Music Assistant.
class PodcastsEndpoint {
  final MusicAssistantClient _client;

  /// Create a PodcastsEndpoint instance
  PodcastsEndpoint(this._client);

  /// Return the number of podcasts in the library.
  Future<int> count({bool favoriteOnly = false}) async {
    return await _client.sendCommand('music/podcasts/count', args: {'favorite_only': favoriteOnly}) as int;
  }

  /// Return a page of podcasts from the library.
  Future<List<Podcast>> libraryItems({
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
      'music/podcasts/library_items',
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
    return result.map((item) => Podcast.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return a podcast by id on the given provider.
  Future<Podcast> get(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/podcasts/get',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return Podcast.fromJson(result as Map<String, dynamic>);
  }

  /// Return the episodes of a podcast.
  Future<List<PodcastEpisode>> episodes(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/podcasts/podcast_episodes',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    ) as List<dynamic>;
    return result.map((item) => PodcastEpisode.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Return a podcast episode by id on the given provider.
  Future<PodcastEpisode> episode(String itemId, String providerInstanceIdOrDomain) async {
    final result = await _client.sendCommand(
      'music/podcasts/podcast_episode',
      args: {'item_id': itemId, 'provider_instance_id_or_domain': providerInstanceIdOrDomain},
    );
    return PodcastEpisode.fromJson(result as Map<String, dynamic>);
  }
}
