# mpd-docker

## Environment variables

|key|example|
|:--|:--|
|MPD_PASSWORD|`password@read,add,control,admin`|

## Ports

- MPD: 6600
- HTTP: 8000

## Volumes

User:Group=102:29

- Music directory: /var/lib/mpd/music
- Playlist directory: /var/lib/mpd/playlists
- Log: /var/log/mpd
