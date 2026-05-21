import 'package:music_assistant/auth_helpers.dart';

void main() async {
  print('Scanning for Music Assistant servers on the local network...');

  final servers = await discoverServers();

  if (servers.isEmpty) {
    print('No servers found.');
    return;
  }

  print('Found ${servers.length} server(s):');
  for (final url in servers) {
    final info = await getServerInfo(url);
    print('- ${info.name ?? info.serverId} at $url (version ${info.serverVersion})');
  }
}
