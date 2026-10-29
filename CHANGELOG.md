# Changelog

## 0.3.0

- Add models for every media item type, with `MediaItemBase` and `ItemMapping` for partial items
- Add `playlists`, `podcasts`, `radios`, `audiobooks`, `tracks`, `artists`, `albums`, `genres`, and `soundEffects` endpoints
- Support Music Assistant 2.7 and newer, tolerating missing keys and unknown enum values
- Add enum values from current upstream
- **Breaking:** `QueueItem.mediaItem` is now a `MediaItemBase`
- **Breaking:** Rename `PlayerQueue.dontStopTheMusicEnabled` to `autoplayEnabled` and `radioSource` to `sources`
- **Breaking:** Add `unknown` values to enums, and new values from upstream, which affects exhaustive switches
- **Breaking:** `Player.icon` defaults to `speaker`

## 0.2.1

- Fix parsing of `MediaItemPalette` colors, which the server sends as `[r, g, b]` arrays

## 0.2.0

- Add `[]`, `values`, and `keys` to stateful endpoints
- Add `auth` endpoint and models
- Expose models and endpoints
- Add `auth_helpers` library

## 0.1.0

- Initial development release.