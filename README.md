# Dart Client for Music Assistant

Dart client for using working with the Music Assistant Websocket API from Dart and Flutter applications.

## Example Usage

```dart
import 'package:music_assistant/music_assistant.dart';

void main() async {
  // Create a client instance, pull url and token from env variables
  final client = MusicAssistantClient('http://localhost:8095', 'your_token_here');

  try {
    // Connect to the server and authenticate
    await client.connect();

    // Fetch initial state for all endpoints (players, player queues, etc.)
    await client.fetchState();

    // Print all players
    print('Players:');
    for (final player in client.players.all.values) {
      print('- ${player.name} (ID: ${player.playerId})');
    }
  } finally {
    // Disconnect from the server when done
    await client.disconnect();
  }
}
```

## Supported Commands

This library supports a subset of the Music Assistant API commands, but aims to be in-line with the official Python client. The following endpoints are currently supported:

- ❌ auth
- ❌ config
- ❌ metadata
- ❌ music
- ❌ party
- ✅ player_queues
- ✅ players
- ❌ providers
- ❌ remote_access
- ❌ tasks

## Rebuilding Models

The models in this library are generated using `json_serializable`. If you make changes to the models, you can rebuild the generated code using the following command:

```bash
dart run build_runner build
dart format lib/src/**/*.g.dart
```