import 'dart:io';

import 'package:music_assistant/client.dart';

void main() async {
  // Create a client instance, pull url and token from environment variables
  final client = MusicAssistantClient(
    serverUrl: Platform.environment['MA_SERVER_URL']!,
    token: Platform.environment['MA_TOKEN']!,
  );

  // Connect to the server and authenticate
  await client.connect();

  // Start listening for events
  client.startListening();

  // Example: get all players
  final result = await client.sendCommand('players/all');
  for (final player in result) {
    print('Player: ${player['name']}');
  }

  // Disconnect when done
  await client.disconnect();
}
