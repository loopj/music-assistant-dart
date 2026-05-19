import 'models/enums.dart';

export 'models/enums.dart' show EventType;

class MusicAssistantEvent {
  final EventType type;
  final String? objectId;
  final Map<String, dynamic>? data;

  const MusicAssistantEvent({required this.type, this.objectId, this.data});
}
