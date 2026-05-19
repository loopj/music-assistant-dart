# Dart Client for Music Assistant

Simple Dart client for using working with the Music Assistant Websocket API from Dart and Flutter applications.

## Example Usage

```dart
import 'package:music_assistant_dart/music_assistant_dart.dart';

void main() async {
  // Create client and connect to Music Assistant
  final client = MusicAssistantClient('http://localhost:8095');
  await client.connect();

  // Listen for player events
  client.events.listen((event) {
    if (event is PlayerStateChangedEvent) {
      print('Player ${event.playerId} state changed: ${event.state}');
    }
  });

  // Print all players
  final players = await client.players.getPlayers();
  print('Players: $players');
}
```

## Supported Commands

This library supports a subset of the Music Assistant API commands, but aims to be in-line with the official Python client. The following endpoints are currently supported:

- [ ] auth
- [ ] config
- [ ] metadata
- [ ] music
- [ ] party
- [x] player_queues
- [x] players
- [ ] providers
- [ ] remote_access
- [ ] tasks

## Rebuilding Models

The models in this library are generated using `json_serializable`. If you make changes to the models, you can rebuild the generated code using the following command:

```bash
dart run build_runner build
```