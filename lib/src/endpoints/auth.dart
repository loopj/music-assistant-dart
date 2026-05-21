import '../client.dart';
import '../models/auth.dart';

/// Auth related endpoints/commands for Music Assistant.
class AuthEndpoint {
  final MusicAssistantClient _client;

  /// Create an AuthEndpoint instance
  AuthEndpoint(this._client);

  /// Get current authenticated user information.
  Future<User> getCurrentUser() async {
    final result = await _client.sendCommand('auth/me');
    return User.fromJson(result as Map<String, dynamic>);
  }

  /// Create a new long-lived access token.
  Future<String> createToken(String name, {String? userId}) async {
    return await _client.sendCommand('auth/token/create', args: {'name': name, 'user_id': userId}) as String;
  }

  /// Revoke an auth token.
  Future<void> revokeToken(String tokenId) async {
    await _client.sendCommand('auth/token/revoke', args: {'token_id': tokenId});
  }

  /// Get auth tokens for current user or another user (admin only).
  Future<List<AuthToken>> getTokens({String? userId}) async {
    final result = await _client.sendCommand('auth/tokens', args: {'user_id': userId}) as List<dynamic>;
    return result.map((item) => AuthToken.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Get user by ID (admin only).
  Future<User?> getUser(String userId) async {
    final result = await _client.sendCommand('auth/user', args: {'user_id': userId});
    if (result == null) return null;
    return User.fromJson(result as Map<String, dynamic>);
  }

  /// Get all users (admin only).
  Future<List<User>> listUsers() async {
    final result = await _client.sendCommand('auth/users') as List<dynamic>;
    return result.map((item) => User.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Create a new user with built-in authentication (admin only).
  Future<User> createUser(
    String username,
    String password, {
    UserRole role = UserRole.user,
    String? displayName,
    String? avatarUrl,
  }) async {
    final result = await _client.sendCommand(
      'auth/user/create',
      args: {
        'username': username,
        'password': password,
        'role': role.value,
        'display_name': displayName,
        'avatar_url': avatarUrl,
      },
    );
    return User.fromJson(result as Map<String, dynamic>);
  }

  /// Delete user account (admin only).
  Future<void> deleteUser(String userId) async {
    await _client.sendCommand('auth/user/delete', args: {'user_id': userId});
  }

  /// Enable user account (admin only).
  Future<void> enableUser(String userId) async {
    await _client.sendCommand('auth/user/enable', args: {'user_id': userId});
  }

  /// Disable user account (admin only).
  Future<void> disableUser(String userId) async {
    await _client.sendCommand('auth/user/disable', args: {'user_id': userId});
  }

  /// Get current user's linked authentication providers.
  Future<List<UserAuthProvider>> getUserProviders() async {
    final result = await _client.sendCommand('auth/user/providers') as List<dynamic>;
    return result.map((item) => UserAuthProvider.fromJson(item as Map<String, dynamic>)).toList();
  }

  /// Unlink authentication provider from user (admin only).
  Future<void> unlinkProvider(String linkId) async {
    await _client.sendCommand('auth/user/unlink_provider', args: {'link_id': linkId});
  }

  /// Update user profile information.
  Future<User> updateUser({
    String? userId,
    String? username,
    String? displayName,
    String? avatarUrl,
    String? password,
    String? oldPassword,
    UserRole? role,
    Map<String, dynamic>? preferences,
  }) async {
    final result = await _client.sendCommand(
      'auth/user/update',
      args: {
        'user_id': userId,
        'username': username,
        'display_name': displayName,
        'avatar_url': avatarUrl,
        'password': password,
        'old_password': oldPassword,
        'role': role?.value,
        'preferences': preferences,
      },
    );
    return User.fromJson(result as Map<String, dynamic>);
  }

  /// Logout current user by revoking the current token.
  Future<void> logout() async {
    await _client.sendCommand('auth/logout');
  }
}
