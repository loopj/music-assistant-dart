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
