import 'dart:convert';
import 'dart:io';

import 'package:music_assistant/models.dart';
import 'package:test/test.dart';

/// Loads a captured server reply from test/fixtures.
List<Map<String, dynamic>> loadFixture(String name) =>
    (jsonDecode(File('test/fixtures/$name.json').readAsStringSync()) as List).cast<Map<String, dynamic>>();

void main() {
  group('Player', () {
    final players = loadFixture('players_all').map(Player.fromJson).toList();

    test('parses every player in players/all', () {
      expect(players.map((p) => p.playerId), ['upsendspinstudydesk', 'RINCON_000000000000001400']);
    });

    test('parses the current media palette', () {
      final palette = players.first.currentMedia!.palette!;
      expect(palette.backgroundDark, (45, 45, 45));
      expect(palette.accent, (194, 182, 197));
      expect(palette.onLight, (47, 47, 47));
    });

    test('parses a player with no current media', () {
      expect(players.last.currentMedia, isNull);
    });

    test('parses a player from a newer server with values it does not know', () {
      final player = Player.fromJson({
        ...loadFixture('players_all').first,
        'supported_features': ['pause', 'teleport'],
        'playback_state': 'buffering',
      });
      expect(player.supportedFeatures, {PlayerFeature.pause, PlayerFeature.unknown});
      expect(player.playbackState, PlaybackState.unknown);
    });

    test('parses device identifiers of a type it does not know', () {
      final device = DeviceInfo.fromJson({
        ...loadFixture('players_all').first['device_info'] as Map<String, dynamic>,
        'identifiers': {'mac_address': '00:00:00:00:00:00', 'zigbee_id': 'abc'},
      });
      expect(device.identifiers, {
        IdentifierType.macAddress: '00:00:00:00:00:00',
        IdentifierType.unknown: 'abc',
      });
    });
  });

  group('PlayerQueue', () {
    final queues = loadFixture('player_queues_all').map(PlayerQueue.fromJson).toList();

    test('parses every queue in player_queues/all', () {
      expect(queues.map((q) => q.queueId), containsAll(['upsendspinstudydesk', 'RINCON_000000000000001400']));
    });

    test('parses the current item', () {
      final queue = queues.firstWhere((q) => q.queueId == 'upsendspinstudydesk');
      expect(queue.currentItem!.name, 'marc thom - Deadmau5 Essential Mix Radio 1 19-07-2008');
    });

    test('parses the media item being played as its own class', () {
      final queue = queues.firstWhere((q) => q.queueId == 'upsendspinstudydesk');
      final track = queue.currentItem!.mediaItem as Track;
      expect(track.name, 'Deadmau5 Essential Mix Radio 1 19-07-2008');
      final episode = QueueItem.fromJson({
        ...(loadFixture('player_queues_all').first['current_item'] as Map<String, dynamic>),
        'media_item': loadFixture('podcast_episodes').first,
      });
      expect(episode.mediaItem, isA<PodcastEpisode>());
    });
  });

  group('Playlist', () {
    final playlists = loadFixture('playlists_library_items').map(Playlist.fromJson).toList();

    test('parses a playlist synced from a streaming provider', () {
      final playlist = playlists.first;
      expect(playlist.name, 'Absolute Boppers');
      expect(playlist.mediaType, MediaType.playlist);
      expect(playlist.isEditable, isTrue);
      expect(playlist.supportedMediatypes, {MediaType.track});
      expect(playlist.providerMappings.single.providerDomain, 'spotify');
      expect(playlist.providerMappings.single.isUnique, isTrue);
      expect(playlist.metadata!.images!.single.remotelyAccessible, isTrue);
    });

    test('parses a dynamic builtin playlist', () {
      final playlist = playlists.last;
      expect(playlist.isDynamic, isTrue);
      expect(playlist.owner, 'Music Assistant');
      expect(playlist.providerMappings.single.providerInstance, 'builtin');
    });

    test('leaves access null when the server sends no access record', () {
      expect(playlists.map((p) => p.access), everyElement(isNull));
    });

    test('maps a media type it does not know to unknown', () {
      final playlist = Playlist.fromJson({
        ...loadFixture('playlists_library_items').last,
        'supported_mediatypes': ['track', 'hologram'],
      });
      expect(playlist.supportedMediatypes, {MediaType.track, MediaType.unknown});
    });
  });

  group('Track', () {
    test('parses a library track whose artists and album are item mappings', () {
      final track = loadFixture('tracks_library_items').map(Track.fromJson).first;
      expect(track.name, '500 Seconds Before Sunset');
      expect(track.duration, 500);
      final artist = track.artists.single as ItemMapping;
      expect(artist.name, 'David Maxim Micic');
      expect(artist.mediaType, MediaType.artist);
      final album = track.album as ItemMapping;
      expect(album.name, 'Eco');
      expect(album.year, 2015);
      expect(album.image, isNotNull);
    });

    test('parses a track without an album', () {
      expect(loadFixture('tracks_library_items').map(Track.fromJson).last.album, isNull);
    });

    test('parses an album track whose artists and album are sent in full', () {
      final track = loadFixture('album_tracks').map(Track.fromJson).last;
      expect(track.trackNumber, 2);
      expect(track.discNumber, 1);
      expect((track.artists.single as Artist).name, 'MPH');
      expect((track.album as Album).name, '132.00FM');
    });
  });

  group('Album', () {
    test('parses an album with its artist as an item mapping', () {
      final album = loadFixture('albums_library_items').map(Album.fromJson).first;
      expect(album.name, '132.00FM');
      expect(album.year, 2023);
      expect(album.albumType, AlbumType.album);
      expect(album.artists.single, isA<ItemMapping>());
    });
  });

  group('Artist', () {
    test('parses every artist in the library', () {
      final artists = loadFixture('artists_library_items').map(Artist.fromJson).toList();
      expect(artists.map((a) => a.name), ['Annie Mac Presents', 'Bass Cadet']);
      expect(artists.map((a) => a.artistType), everyElement(ArtistType.singer));
    });
  });

  group('Genre', () {
    final genres = loadFixture('genres_library_items').map(Genre.fromJson).toList();

    test('parses a music genre', () {
      expect(genres.first.name, 'Dance');
      expect(genres.first.mediaType, MediaType.genre);
      expect(genres.first.contentType, isNull);
    });

    test('parses a podcast genre from its own taxonomy', () {
      expect(genres.last.name, 'Arts');
      expect(genres.last.contentType, MediaType.podcast);
    });
  });

  group('SoundEffect', () {
    test('parses every sound effect', () {
      final effects = loadFixture('sound_effects').map(SoundEffect.fromJson).toList();
      expect(effects.map((e) => e.name), ['White noise', 'Pink noise']);
      expect(effects.map((e) => e.duration), everyElement(30));
    });
  });

  group('MediaItemBase', () {
    test('parses each media type to its own class', () {
      final items = [
        ...loadFixture('album_tracks'),
        ...loadFixture('radios_search'),
        ...loadFixture('podcast_episodes'),
        ...loadFixture('genres_library_items'),
        ...loadFixture('sound_effects'),
      ].map(MediaItemBase.fromJson).toList();
      expect(items.map((item) => item.runtimeType).toSet(), {Track, Radio, PodcastEpisode, Genre, SoundEffect});
    });

    test('parses a type it does not model as an item mapping', () {
      final item = MediaItemBase.fromJson({...loadFixture('album_tracks').first, 'media_type': 'hologram'});
      expect(item, isA<ItemMapping>());
      expect(item.mediaType, MediaType.unknown);
    });
  });

  group('Radio', () {
    final radios = loadFixture('radios_search').map(Radio.fromJson).toList();

    test('parses a broadcast station', () {
      final radio = radios.first;
      expect(radio.name, 'BBC Radio 1');
      expect(radio.mediaType, MediaType.radio);
      expect(radio.isDynamic, isFalse);
      expect(radio.providerMappings.single.providerDomain, 'bbc_sounds');
    });

    test('treats a station as endless when the server does not say', () {
      expect(radios.map((r) => r.isEndless), everyElement(isTrue));
    });
  });

  group('Audiobook', () {
    final audiobooks = loadFixture('audiobooks_get').map(Audiobook.fromJson).toList();

    test('parses an audiobook with its chapters', () {
      final audiobook = audiobooks.first;
      expect(audiobook.name, 'Project Hail Mary');
      expect(audiobook.mediaType, MediaType.audiobook);
      expect(audiobook.authors, ['Andy Weir']);
      expect(audiobook.narrators, ['David Garmark']);
      expect(audiobook.duration, 54555);
      final chapters = audiobook.metadata!.chapters!;
      expect(chapters, hasLength(11));
      expect(chapters[1].position, 2);
      expect(chapters[1].start, 3515.687);
      expect(chapters[1].end, 7992.494);
    });

    test('parses authors and narrators sent as artist objects', () {
      final audiobook = Audiobook.fromJson({
        ...loadFixture('audiobooks_get').last,
        'authors': [
          {'item_id': '1', 'provider': 'library', 'name': 'Douglas Adams', 'media_type': 'artist'},
        ],
        'narrators': ['Stephen Fry'],
      });
      expect(audiobook.authors, ['Douglas Adams']);
      expect(audiobook.narrators, ['Stephen Fry']);
    });
  });

  group('Podcast', () {
    final podcasts = loadFixture('podcasts_library_items').map(Podcast.fromJson).toList();

    test('parses every podcast in the library', () {
      expect(podcasts.map((p) => p.name), [
        'Homebrew Game Club',
        "Radio 1's Classic Essential Mix",
        "Radio 1's Essential Mix",
      ]);
      expect(podcasts.map((p) => p.mediaType), everyElement(MediaType.podcast));
      expect(podcasts.first.totalEpisodes, 50);
    });
  });

  group('PodcastEpisode', () {
    final episodes = loadFixture('podcast_episodes').map(PodcastEpisode.fromJson).toList();

    test('parses an episode with its podcast', () {
      final episode = episodes.first;
      expect(episode.name, 'Gumballs and DoomKnights: Live at MGC Part 2');
      expect(episode.mediaType, MediaType.podcastEpisode);
      expect(episode.position, 51);
      expect(episode.duration, 2275);
      expect(episode.metadata!.releaseDate, DateTime.utc(2026, 9, 2));
      expect(episode.podcast!.name, 'Homebrew Game Club');
    });

    test('leaves the resume point null when the provider cannot tell', () {
      expect(episodes.first.fullyPlayed, isNull);
      expect(episodes.first.resumePositionMs, isNull);
    });

    test('reads the played flag sent as 0 or 1', () {
      final played = PodcastEpisode.fromJson({...loadFixture('podcast_episodes').first, 'fully_played': 1});
      final unplayed = PodcastEpisode.fromJson({...loadFixture('podcast_episodes').first, 'fully_played': 0});
      expect(played.fullyPlayed, isTrue);
      expect(unplayed.fullyPlayed, isFalse);
    });

    test('parses a podcast sent as a reduced item mapping', () {
      final episode = PodcastEpisode.fromJson({
        ...loadFixture('podcast_episodes').first,
        'podcast': {
          'item_id': '4',
          'provider': 'library',
          'name': 'Homebrew Game Club',
          'version': '',
          'sort_name': 'homebrew game club',
          'uri': 'library://podcast/4',
          'external_ids': [],
          'is_playable': true,
          'media_type': 'podcast',
          'translation_key': null,
          'available': true,
          'image': null,
          'year': null,
        },
      });
      expect(episode.podcast, isA<ItemMapping>());
      expect(episode.podcast!.name, 'Homebrew Game Club');
      expect(episode.podcast!.mediaType, MediaType.podcast);
    });

    test('parses a podcast sent in full', () {
      expect(episodes.first.podcast, isA<Podcast>());
    });
  });

  group('PlaylistAccess', () {
    test('parses a collaborative playlist shared with selected users', () {
      final access = PlaylistAccess.fromJson({
        'owner': 'user-1',
        'sharing': 'selected',
        'shared_users': ['user-2'],
        'collaborative': true,
      });
      expect(access.sharing, ProviderSharing.selected);
      expect(access.sharedUsers, ['user-2']);
      expect(access.collaborative, isTrue);
    });
  });

  group('Generated models', () {
    test('give every enum field a fallback for values from newer servers', () {
      final decodesWithoutFallback = Directory('lib/src/models')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.g.dart'))
          .expand((file) => file
              .readAsLinesSync()
              .where((line) => line.contains(r'$enumDecode') && !line.contains('unknownValue:'))
              .map((line) => '${file.path}: ${line.trim()}'));
      expect(decodesWithoutFallback, isEmpty, reason: 'add unknownEnumValue to the JsonKey of each field listed');
    });

    test('use each field initializer as the default for a key older servers leave out', () {
      final fieldsWithoutDefault = <String>[];
      for (final file in Directory('lib/src/models').listSync(recursive: true).whereType<File>()) {
        if (!file.path.endsWith('.dart') || file.path.endsWith('.g.dart')) continue;
        final lines = file.readAsLinesSync();
        for (var i = 0; i < lines.length; i++) {
          final key = lines[i].trim();
          if (!key.startsWith('@JsonKey(') || key.contains(RegExp('defaultValue:|readValue:'))) continue;
          final field = lines.skip(i + 1).firstWhere((line) => !line.trim().startsWith('@')).trim();
          if (field.contains(' = ') && !field.contains('(')) fieldsWithoutDefault.add('${file.path}: $field');
        }
      }
      expect(fieldsWithoutDefault, isEmpty, reason: 'add a defaultValue matching the initializer of each field listed');
    });
  });

  group('MediaItemPalette', () {
    test('round trips colors as [r, g, b] arrays', () {
      final json = {
        'background_dark': [1, 2, 3],
        'background_light': null,
        'primary': [4, 5, 6],
        'accent': null,
        'on_dark': null,
        'on_light': [7, 8, 9],
      };
      expect(MediaItemPalette.fromJson(json).toJson(), json);
    });

    test('leaves missing colors null', () {
      final palette = MediaItemPalette.fromJson({});
      expect(palette.primary, isNull);
      expect(palette.toJson()['primary'], isNull);
    });
  });
}
