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
enum ImageType {
  thumb('thumb'),
  landscape('landscape'),
  fanart('fanart'),
  logo('logo'),
  clearart('clearart'),
  banner('banner'),
  cutout('cutout'),
  back('back'),
  discart('discart'),
  other('other');

  const ImageType(this.value);
  final String value;
}

@JsonEnum(valueField: 'value')
enum ContentType {
  ogg('ogg'),
  wav('wav'),
  aiff('aiff'),
  mpeg('mpeg'),
  m4a('m4a'),
  mp4('mp4'),
  mp4a('mp4a'),
  m4b('m4b'),
  dsf('dsf'),
  flac('flac'),
  mp3('mp3'),
  wma('wma'),
  wmav2('wmav2'),
  wmapro('wmapro'),
  wavpack('wavpack'),
  tak('tak'),
  ape('ape'),
  musepack('mpc'),
  aac('aac'),
  alac('alac'),
  opus('opus'),
  vorbis('vorbis'),
  ac3('ac3'),
  eac3('eac3'),
  dts('dts'),
  truehd('truehd'),
  dtshd('dtshd'),
  dtsx('dtsx'),
  cook('cook'),
  ra144('ralf'),
  mp2('mp2'),
  mp1('mp1'),
  dra('dra'),
  atrac3('atrac3'),
  pcmS16le('s16le'),
  pcmS24le('s24le'),
  pcmS32le('s32le'),
  pcmF32le('f32le'),
  pcmF64le('f64le'),
  pcmS16be('s16be'),
  pcmS24be('s24be'),
  pcmS32be('s32be'),
  pcmBluray('pcm_bluray'),
  pcmDvd('pcm_dvd'),
  adpcmIma('adpcm_ima_qt'),
  adpcmMs('adpcm_ms'),
  adpcmSwf('adpcm_swf'),
  dsdLsbf('dsd_lsbf'),
  dsdMsbf('dsd_msbf'),
  dsdLsbfPlanar('dsd_lsbf_planar'),
  dsdMsbfPlanar('dsd_msbf_planar'),
  amr('amr_nb'),
  amrWb('amr_wb'),
  speex('speex'),
  pcmAlaw('alaw'),
  pcmMulaw('mulaw'),
  g722('g722'),
  g726('g726'),
  pcm('pcm'),
  nut('nut'),
  unknown('?');

  const ContentType(this.value);
  final String value;
}

@JsonEnum(valueField: 'value')
enum QueueOption {
  play('play'),
  replace('replace'),
  next('next'),
  replaceNext('replace_next'),
  add('add'),
  unknown('unknown');

  const QueueOption(this.value);
  final String value;
}

@JsonEnum(valueField: 'value')
enum RepeatMode {
  off('off'),
  one('one'),
  all('all'),
  unknown('unknown');

  const RepeatMode(this.value);
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

enum EventType {
  playerAdded('player_added'),
  playerUpdated('player_updated'),
  playerRemoved('player_removed'),
  playerConfigUpdated('player_config_updated'),
  playerDspConfigUpdated('player_dsp_config_updated'),
  playerOptionsUpdated('player_options_updated'),
  dspPresetsUpdated('dsp_presets_updated'),
  queueAdded('queue_added'),
  queueUpdated('queue_updated'),
  queueItemsUpdated('queue_items_updated'),
  queueTimeUpdated('queue_time_updated'),
  mediaItemPlayed('media_item_played'),
  mediaItemAdded('media_item_added'),
  mediaItemUpdated('media_item_updated'),
  mediaItemDeleted('media_item_deleted'),
  providersUpdated('providers_updated'),
  syncTasksUpdated('sync_tasks_updated'),
  tasksUpdated('tasks_updated'),
  musicSyncCompleted('music_sync_completed'),
  authSession('auth_session'),
  coreStateUpdated('core_state_updated'),
  unknown('unknown');

  const EventType(this.value);

  final String value;

  static EventType fromValue(String value) =>
      EventType.values.firstWhere((e) => e.value == value, orElse: () => EventType.unknown);
}

@JsonEnum(valueField: 'value')
enum StreamType {
  http('http'),
  encryptedHttp('encrypted_http'),
  hls('hls'),
  icy('icy'),
  shoutcast('shoutcast'),
  inBand('in_band'),
  localFile('local_file'),
  namedPipe('named_pipe'),
  otherFfmpeg('other_ffmpeg'),
  custom('custom'),
  unknown('unknown');

  const StreamType(this.value);
  final String value;
}

@JsonEnum(valueField: 'value')
enum CoreState {
  starting('starting'),
  running('running'),
  stopping('stopping'),
  stopped('stopped');

  const CoreState(this.value);
  final String value;
}
