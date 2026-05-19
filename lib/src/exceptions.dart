/// Custom Exception for all server-side errors.
class MusicAssistantException implements Exception {
  final String? message;
  const MusicAssistantException([this.message]);

  @override
  String toString() => message != null ? '$runtimeType: $message' : runtimeType.toString();
}

/// Error raised when trying to access mediaitem of unavailable provider.
class ProviderUnavailableException extends MusicAssistantException {
  const ProviderUnavailableException([super.message]);
}

/// Error raised when trying to access non existing media item.
class MediaNotFoundException extends MusicAssistantException {
  const MediaNotFoundException([super.message]);
}

/// Error raised when an object has invalid data.
class InvalidDataException extends MusicAssistantException {
  const InvalidDataException([super.message]);
}

/// Error raised when a duplicate music provider or player is registered.
class AlreadyRegisteredException extends MusicAssistantException {
  const AlreadyRegisteredException([super.message]);
}

/// Error raised when setup of a provider or player failed.
class SetupFailedException extends MusicAssistantException {
  const SetupFailedException([super.message]);
}

/// Error raised when a login failed.
class LoginFailedException extends MusicAssistantException {
  const LoginFailedException([super.message]);
}

/// Error raised when an issue arose when processing audio.
class AudioException extends MusicAssistantException {
  const AudioException([super.message]);
}

/// Error raised when trying to start queue stream while queue is empty.
class QueueEmptyException extends MusicAssistantException {
  const QueueEmptyException([super.message]);
}

/// Error raised when a feature is not supported.
class UnsupportedFeatureException extends MusicAssistantException {
  const UnsupportedFeatureException([super.message]);
}

/// Error raised when trying to access non-existing or unavailable player.
class PlayerUnavailableException extends MusicAssistantException {
  const PlayerUnavailableException([super.message]);
}

/// Error raised when a command to a player failed execution.
class PlayerCommandFailedException extends MusicAssistantException {
  const PlayerCommandFailedException([super.message]);
}

/// Error raised when an unknown command is requested on the API.
class InvalidCommandException extends MusicAssistantException {
  const InvalidCommandException([super.message]);
}

/// Error thrown when a MediaItem cannot be played properly.
class UnplayableMediaException extends MusicAssistantException {
  const UnplayableMediaException([super.message]);
}

/// Error thrown when a provider URI does not match a known format.
class InvalidProviderURIException extends MusicAssistantException {
  const InvalidProviderURIException([super.message]);
}

/// Error thrown when a provider media item identifier does not match a known format.
class InvalidProviderIDException extends MusicAssistantException {
  const InvalidProviderIDException([super.message]);
}

/// Error thrown when retries to a given provider URI have been exhausted.
class RetriesExhaustedException extends MusicAssistantException {
  const RetriesExhaustedException([super.message]);
}

/// Error thrown when a resource is temporarily unavailable.
class ResourceTemporarilyUnavailableException extends MusicAssistantException {
  const ResourceTemporarilyUnavailableException([super.message]);
}

/// Error thrown when a provider action is denied because of permissions.
class ProviderPermissionDeniedException extends MusicAssistantException {
  const ProviderPermissionDeniedException([super.message]);
}

/// Error thrown when a action is denied because is is (temporary) unavailable/not possible.
class ActionUnavailableException extends MusicAssistantException {
  const ActionUnavailableException([super.message]);
}

/// Error raised when authentication is required but not provided.
class AuthenticationRequiredException extends MusicAssistantException {
  const AuthenticationRequiredException([super.message]);
}

/// Error raised when authentication credentials are invalid.
class AuthenticationFailedException extends MusicAssistantException {
  const AuthenticationFailedException([super.message]);
}

/// Error raised when user lacks required permissions for an action.
class InsufficientPermissionsException extends MusicAssistantException {
  const InsufficientPermissionsException([super.message]);
}

/// Error raised when an access token is invalid or expired.
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

/// Custom Exception for all client-side errors.
class MusicAssistantClientException extends MusicAssistantException {
  const MusicAssistantClientException([super.message]);
}

/// Exception raised when connected to server with incompatible version.
class InvalidServerVersion extends MusicAssistantClientException {
  const InvalidServerVersion([super.message]);
}
