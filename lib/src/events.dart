import 'models/enums.dart';

export 'models/enums.dart' show EventType;

/// A server-pushed event received from the Music Assistant WebSocket API.
class MusicAssistantEvent {
  final EventType type;
  final String? objectId;
  final Map<String, dynamic>? data;

  const MusicAssistantEvent({required this.type, this.objectId, this.data});
}
