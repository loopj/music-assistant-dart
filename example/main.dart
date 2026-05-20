import 'dart:io';

import 'package:music_assistant/music_assistant.dart';

void main() async {
  // Create a client instance, pull url and token from env variables
  final client = MusicAssistantClient(
    serverUrl: Platform.environment['MA_SERVER_URL']!,
    token: Platform.environment['MA_TOKEN']!,
  );

  try {
    // Connect to the WebSocket server and authenticate
    await client.connect();

    // Fetch initial state for all endpoints (players, player queues, etc.)
    await client.fetchState();

    // Example: Print all players
    print('Players:');
    for (final player in client.players.values) {
      print('- ${player.name} (ID: ${player.playerId})');
    }
  } finally {
    // Disconnect from the server when done
    await client.disconnect();
  }
}
