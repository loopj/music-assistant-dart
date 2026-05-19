import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum MediaType {
  artist('artist'),
  album('album'),
  track('track'),
  playlist('playlist'),
  radio('radio'),
  audiobook('audiobook'),
  podcast('podcast'),
  podcastEpisode('podcast_episode'),
  folder('folder'),
  announcement('announcement'),
  flowStream('flow_stream'),
  pluginSource('plugin_source'),
  soundEffect('sound_effect'),
  genre('genre'),
  unknown('unknown');

  const MediaType(this.value);
  final String value;
}

@JsonEnum(valueField: 'value')
enum PlaybackState {
  idle('idle'),
  paused('paused'),
  playing('playing'),
  unknown('unknown');

  const PlaybackState(this.value);
  final String value;
}

@JsonEnum(valueField: 'value')
enum IdentifierType {
  macAddress('mac_address'),
  serialNumber('serial_number'),
  uuid('uuid'),
  castUuid('cast_uuid'),
  airplayId('airplay_id'),
  ipAddress('ip_address'),
  unknown('unknown');

  const IdentifierType(this.value);
  final String value;
}

@JsonEnum(valueField: 'value')
enum PlayerFeature {
  power('power'),
  volumeSet('volume_set'),
  volumeMute('volume_mute'),
  pause('pause'),
  setMembers('set_members'),
  multiDeviceDsp('multi_device_dsp'),
  seek('seek'),
  nextPrevious('next_previous'),
  playAnnouncement('play_announcement'),
  enqueue('enqueue'),
  selectSoundMode('select_sound_mode'),
  selectSource('select_source'),
  options('options'),
  gaplessPlayback('gapless_playback'),
  gaplessDifferentSamplerate('gapless_different_samplerate'),
  playMedia('play_media'),
  unknown('unknown');

  const PlayerFeature(this.value);
  final String value;
}
