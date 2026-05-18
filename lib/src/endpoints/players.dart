import '../client.dart';
import '../events.dart';
import '../models/player.dart';

/// Player related endpoints/data for Music Assistant.
class PlayersService {
  final MusicAssistantClient _client;
  Map<String, Player> _players = {};

  /// Create a PlayersService instance
  PlayersService(this._client) {
    // Subscribe to player events.
    _client.subscribe(
      _onEvent,
      eventTypes: {
        EventType.playerAdded,
        EventType.playerUpdated,
        EventType.playerRemoved,
      },
    );
  }

  /// Get a view of all players.
  Map<String, Player> get all => Map.unmodifiable(_players);

  //
  // "Player" related endpoints/commands.
  //

  /// Send STOP command to given player (directly).
  Future<void> stop(String playerId) async {
    await _client.sendCommand('player/cmd/stop', args: {'player_id': playerId});
  }

  /// Send PLAY command to given player (directly).
  Future<void> play(String playerId) async {
    await _client.sendCommand('player/cmd/play', args: {'player_id': playerId});
  }

  /// Send PAUSE command to given player (directly).
  Future<void> pause(String playerId) async {
    await _client.sendCommand('player/cmd/pause', args: {'player_id': playerId});
  }

  /// Send PLAY_PAUSE (toggle) command to given player (directly).
  Future<void> playPause(String playerId) async {
    await _client.sendCommand('player/cmd/play_pause', args: {'player_id': playerId});
  }

  /// Send POWER command to given player.
  Future<void> power(String playerId, bool powered) async {
    await _client.sendCommand('player/cmd/power', args: {'player_id': playerId, 'powered': powered});
  }

  /// Send VOLUME SET command to given player.
  Future<void> volumeSet(String playerId, int volumeLevel) async {
    await _client.sendCommand('player/cmd/volume_set', args: {'player_id': playerId, 'volume': volumeLevel});
  }

  /// Send VOLUME UP command to given player.
  Future<void> volumeUp(String playerId) async {
    await _client.sendCommand('player/cmd/volume_up', args: {'player_id': playerId});
  }

  /// Send VOLUME DOWN command to given player.
  Future<void> volumeDown(String playerId) async {
    await _client.sendCommand('player/cmd/volume_down', args: {'player_id': playerId});
  }

  /// Send VOLUME MUTE command to given player.
  Future<void> volumeMute(String playerId, bool muted) async {
    await _client.sendCommand('player/cmd/volume_mute', args: {'player_id': playerId, 'muted': muted});
  }

  /// Handle SEEK command for the given player (directly).
  Future<void> seek(String playerId, double position) async {
    await _client.sendCommand('player/cmd/seek', args: {'player_id': playerId, 'position': position});
  }

  /// Handle NEXT TRACK command for given player.
  Future<void> nextTrack(String playerId) async {
    await _client.sendCommand('player/cmd/next', args: {'player_id': playerId});
  }

  /// Handle PREVIOUS TRACK command for given player.
  Future<void> previousTrack(String playerId) async {
    await _client.sendCommand('player/cmd/previous', args: {'player_id': playerId});
  }

  /// Handle SELECT SOURCE command on given player.
  Future<void> selectSource(String playerId, String source) async {
    await _client.sendCommand('player/cmd/select_source', args: {'player_id': playerId, 'source': source});
  }

  /// Handle SELECT SOUND MODE command on given player.
  Future<void> selectSoundMode(String playerId, String soundMode) async {
    await _client.sendCommand('player/cmd/select_sound_mode', args: {'player_id': playerId, 'sound_mode': soundMode});
  }

  /// Handle SET_OPTION command on given player.
  /// TODO

  /// Handle GROUP command for given player.
  Future<void> group(String playerId, String targetPlayer) async {
    await _client.sendCommand('player/cmd/group', args: {'player_id': playerId, 'target_player': targetPlayer});
  }

  /// Handle UNGROUP command for given player.
  Future<void> ungroup(String playerId) async {
    await _client.sendCommand('player/cmd/ungroup', args: {'player_id': playerId});
  }

  /// Join given player(s) to target player.
  Future<void> join(String targetPlayer, List<String> childPlayerIds) async {
    await _client.sendCommand('player/cmd/group_many',
        args: {'target_player': targetPlayer, 'child_player_ids': childPlayerIds});
  }

  /// Handle UNGROUP command for all the given players.
  Future<void> ungroupMany(List<String> playerIds) async {
    await _client.sendCommand('player/cmd/ungroup_many', args: {'player_ids': playerIds});
  }

  /// Handle playback of an announcement (url) on given player.
  Future<void> playAnnouncement(String playerId, String url,
      {bool? preAnnounce, int? volumeLevel, String? preAnnounceUrl}) async {
    await _client.sendCommand('player/cmd/play_announcement', args: {
      'player_id': playerId,
      'url': url,
      'pre_announce': preAnnounce,
      'volume_level': volumeLevel,
      'pre_announce_url': preAnnounceUrl
    });
  }

  //
  // PlayerGroup related endpoints/commands.
  //

  // TODO

  /// Fetch initial state once the server is connected.
  Future<void> fetchState() async {
    for (final player in await _getPlayers()) {
      _players[player.playerId!] = player;
    }
  }

  // Fetch all Players from the server.
  Future<List<Player>> _getPlayers() async {
    final result = await _client.sendCommand('players/all') as List<dynamic>;
    return result.map((item) => Player.fromJson(item as Map<String, dynamic>)).toList();
  }

  // Handle incoming player event.
  void _onEvent(MusicAssistantEvent event) {
    switch (event.type) {
      case EventType.playerAdded || EventType.playerUpdated:
        assert(event.objectId != null);
        _players[event.objectId!] = Player.fromJson(event.data!);

      case EventType.playerRemoved:
        assert(event.objectId != null);
        _players.remove(event.objectId);

      default:
        break;
    }
  }
}
