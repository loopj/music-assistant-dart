# Dart Client for Music Assistant

Dart client for using working with the [Music Assistant](https://www.music-assistant.io) Websocket API from Dart and Flutter applications.

## Example

```dart
import 'package:music_assistant/music_assistant.dart';

void main() async {
  final client = MusicAssistantClient(
    serverUrl: 'http://localhost:8095',
    token: 'your_token_here',
  );

  try {
    await client.connect();
    await client.fetchState();

    for (final player in client.players.values) {
      print('${player.name}: ${player.state}');
    }
  } finally {
    await client.disconnect();
  }
}
```

## Features

- Manages WebSocket connections, with automatic reconnection
- Provides functions for accessing and controlling Music Assistant endpoints
- Fetches state on demand, and keeps it up to date
- Supports subscribing to server events for real-time updates

## Supported endpoints

This package currently supports the `auth`, `players`, and `player_queues` endpoints.

## Usage

### Connecting

```dart
final client = MusicAssistantClient(
  serverUrl: 'http://localhost:8095',
  token: 'your_token_here',
);

await client.connect();
```

### Sending commands

Use endpoint methods to send commands to the server:

```dart
await client.players.play('player_id');
await client.players.pause('player_id');
await client.players.volumeSet('player_id', 50);
await client.playerQueues.next('queue_id');
// ...etc
```

See the [API documentation](https://pub.dev/documentation/music_assistant/) for a full list of available commands.

### Fetching state

Fetch the current state of players and queues to have a local copy that is kept up to date with server events:

```dart
// Fetch state for all endpoints
await client.fetchState();

// ...or fetch state endpoints individually
await client.players.fetchState();
```

### Accessing a single object

Once you have fetched the state, you can access a single object by id using the `[]` operator on the endpoint:

```dart
Player? player = client.players['player_id'];
```

### Iterating over all objects

You can also access all objects using the iterable `values` property:

```dart
for (final player in client.players.values) {
  print('${player.name}: ${player.state}');
}
```

### Subscribing to events

Once fetched, the client will keep the local state up to date by subscribing to server events. You can also subscribe to events directly if you want to react to them in real-time:

```dart
// Subscribe to player updates
final unsubscribe = client.subscribe(
  (event) => print('Event: ${event.type} (${event.objectId})'),
  eventTypes: {EventType.playerUpdated},
);

// Cancel the subscription later
unsubscribe();
```

## License

This project is licensed under the [MIT License](LICENSE).