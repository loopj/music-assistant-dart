import 'package:music_assistant/music_assistant.dart';
import 'package:test/test.dart';

void main() {
  group('musicAssistantExceptionFromErrorCode', () {
    test('maps known error codes to their exception', () {
      expect(musicAssistantExceptionFromErrorCode(2, null), isA<MediaNotFoundException>());
      expect(musicAssistantExceptionFromErrorCode(21, null), isA<AuthenticationFailedException>());
      expect(musicAssistantExceptionFromErrorCode(23, null), isA<InvalidTokenException>());
    });

    test('maps unknown error codes to the base exception', () {
      final exception = musicAssistantExceptionFromErrorCode(999, 'details');
      expect(exception.runtimeType, MusicAssistantException);
      expect(exception.message, 'details');
    });
  });
}
