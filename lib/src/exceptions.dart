// Exceptions from the Music Assistant server
class MusicAssistantException implements Exception {
  final String? message;
  const MusicAssistantException([this.message]);

  @override
  String toString() => message != null ? '$runtimeType: $message' : runtimeType.toString();
}

class ProviderUnavailableException extends MusicAssistantException {
  const ProviderUnavailableException([super.message]);
}

class MediaNotFoundException extends MusicAssistantException {
  const MediaNotFoundException([super.message]);
}

class InvalidDataException extends MusicAssistantException {
  const InvalidDataException([super.message]);
}

class AlreadyRegisteredException extends MusicAssistantException {
  const AlreadyRegisteredException([super.message]);
}

class SetupFailedException extends MusicAssistantException {
  const SetupFailedException([super.message]);
}

class LoginFailedException extends MusicAssistantException {
  const LoginFailedException([super.message]);
}

class AudioException extends MusicAssistantException {
  const AudioException([super.message]);
}

class QueueEmptyException extends MusicAssistantException {
  const QueueEmptyException([super.message]);
}

class UnsupportedFeatureException extends MusicAssistantException {
  const UnsupportedFeatureException([super.message]);
}

class PlayerUnavailableException extends MusicAssistantException {
  const PlayerUnavailableException([super.message]);
}

class PlayerCommandFailedException extends MusicAssistantException {
  const PlayerCommandFailedException([super.message]);
}

class InvalidCommandException extends MusicAssistantException {
  const InvalidCommandException([super.message]);
}

class UnplayableMediaException extends MusicAssistantException {
  const UnplayableMediaException([super.message]);
}

class InvalidProviderURIException extends MusicAssistantException {
  const InvalidProviderURIException([super.message]);
}

class InvalidProviderIDException extends MusicAssistantException {
  const InvalidProviderIDException([super.message]);
}

class RetriesExhaustedException extends MusicAssistantException {
  const RetriesExhaustedException([super.message]);
}

class ResourceTemporarilyUnavailableException extends MusicAssistantException {
  const ResourceTemporarilyUnavailableException([super.message]);
}

class ProviderPermissionDeniedException extends MusicAssistantException {
  const ProviderPermissionDeniedException([super.message]);
}

class ActionUnavailableException extends MusicAssistantException {
  const ActionUnavailableException([super.message]);
}

class AuthenticationRequiredException extends MusicAssistantException {
  const AuthenticationRequiredException([super.message]);
}

class AuthenticationFailedException extends MusicAssistantException {
  const AuthenticationFailedException([super.message]);
}

class InsufficientPermissionsException extends MusicAssistantException {
  const InsufficientPermissionsException([super.message]);
}

class InvalidTokenException extends MusicAssistantException {
  const InvalidTokenException([super.message]);
}

/// Creates the appropriate [MusicAssistantException] subclass for [errorCode].
MusicAssistantException musicAssistantExceptionFromErrorCode(int errorCode, String? message) => switch (errorCode) {
      1 => ProviderUnavailableException(message),
      2 => MediaNotFoundException(message),
      3 => InvalidDataException(message),
      4 => AlreadyRegisteredException(message),
      5 => SetupFailedException(message),
      6 => LoginFailedException(message),
      7 => AudioException(message),
      8 => QueueEmptyException(message),
      9 => UnsupportedFeatureException(message),
      10 => PlayerUnavailableException(message),
      11 => PlayerCommandFailedException(message),
      12 => InvalidCommandException(message),
      13 => UnplayableMediaException(message),
      14 => InvalidProviderURIException(message),
      15 => InvalidProviderIDException(message),
      16 => RetriesExhaustedException(message),
      17 => ResourceTemporarilyUnavailableException(message),
      18 => ProviderPermissionDeniedException(message),
      19 => ActionUnavailableException(message),
      20 => AuthenticationRequiredException(message),
      21 => AuthenticationFailedException(message),
      22 => InsufficientPermissionsException(message),
      23 => InvalidTokenException(message),
      _ => MusicAssistantException(message),
    };

// Exceptions related to the Music Assistant client itself
class MusicAssistantClientException extends MusicAssistantException {
  const MusicAssistantClientException([super.message]);
}

class InvalidServerVersion extends MusicAssistantClientException {
  const InvalidServerVersion([super.message]);
}
