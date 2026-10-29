import '../client.dart';
import '../models/media_items/media_item.dart';

/// Sound effect related endpoints/commands for Music Assistant.
class SoundEffectsEndpoint {
  final MusicAssistantClient _client;

  /// Create a SoundEffectsEndpoint instance
  SoundEffectsEndpoint(this._client);

  /// Return every sound effect the server offers.
  Future<List<SoundEffect>> all() async {
    final result = await _client.sendCommand('music/sound_effects') as List<dynamic>;
    return result.map((item) => SoundEffect.fromJson(item as Map<String, dynamic>)).toList();
  }
}
