import 'dart:convert';

import 'package:http/http.dart' as http;

import 'src/client.dart';
import 'src/exceptions.dart';
import 'src/models/api.dart';
import 'src/models/auth.dart';

const _defaultTokenName = 'Music Assistant Dart Client';

/// Log in to a Music Assistant server with username and password.
///
/// Returns a tuple of (User, access_token). Throws [LoginFailedException] for
/// bad credentials or [CannotConnectException] for connection-level failures.
Future<(User, String)> login(String serverUrl, String username, String password) async {
  final url = _normalizeUrl(serverUrl);
  try {
    final response = await http.post(
      Uri.parse('${url}auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 401) {
      throw const LoginFailedException('Invalid username or password');
    }
    if (response.statusCode != 200) {
      throw CannotConnectException('Login failed with status ${response.statusCode}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final user = User.fromJson(data['user'] as Map<String, dynamic>);
    final accessToken = data['access_token'] as String;
    return (user, accessToken);
  } on LoginFailedException {
    rethrow;
  } on CannotConnectException {
    rethrow;
  } on http.ClientException catch (e) {
    throw CannotConnectException(e.message);
  }
}

/// Log in and immediately exchange the session token for a long-lived token.
///
/// Returns a tuple of (User, long_lived_token).
Future<(User, String)> loginWithToken(
  String serverUrl,
  String username,
  String password, {
  String tokenName = _defaultTokenName,
}) async {
  final (user, accessToken) = await login(serverUrl, username, password);
  final longLivedToken = await createLongLivedToken(serverUrl, accessToken, tokenName: tokenName);
  return (user, longLivedToken);
}

/// Create a long-lived token using an existing session token.
Future<String> createLongLivedToken(
  String serverUrl,
  String accessToken, {
  String tokenName = _defaultTokenName,
}) async {
  final client = MusicAssistantClient(serverUrl: serverUrl, token: accessToken);
  await client.connect();
  try {
    return await client.auth.createToken(tokenName);
  } finally {
    await client.disconnect();
  }
}

/// Get server information from the /info endpoint (no authentication required).
///
/// Useful for checking server availability and version before connecting.
Future<ServerInfoMessage> getServerInfo(String serverUrl) async {
  final url = _normalizeUrl(serverUrl);
  try {
    final response = await http.get(Uri.parse('${url}info'));
    if (response.statusCode != 200) {
      throw CannotConnectException('Failed to get server info with status ${response.statusCode}');
    }
    return ServerInfoMessage.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } on CannotConnectException {
    rethrow;
  } on http.ClientException catch (e) {
    throw CannotConnectException(e.message);
  }
}

String _normalizeUrl(String url) => url.endsWith('/') ? url : '$url/';
