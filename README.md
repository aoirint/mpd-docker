# mpd-docker

MPD (Music player daemon) Docker image

- Repository: <https://github.com/aoirint/mpd-docker>
- Docker Hub: <https://hub.docker.com/r/aoirint/mpd>

## Outputs

- PulseAudio (Host general user deamon)
- HTTP

## Environment variables

|key|example|
|:--|:--|
|HOST_MPD_PORT|`127.0.0.1:6600`|
|HOST_HTTP_PORT|`127.0.0.1:8000`|
|PULSE_SERVER|`unix:/run/user/1000/pulse/native`|
|HOST_AUDIO_GROUP|`audio`|
|HOST_UID|`1000`|
|HOST_GID|`1000`|
|HOST_PULSE_NATIVE_FILE|`/run/user/1000/pulse/native`|
|HOST_PULSE_COOKIE_FILE|`/home/user/.config/pulse/cookie`|
|MPD_PASSWORD|`password@read,add,control,admin`|

- HOST_AUDIO_GROUP: `getent group audio | cut -d: -f3`
- HOST_UID: `id -u`
- HOST_GID: `id -g`
- `/run/user/1000`: `echo ${XDG_RUNTIME_DIR}`
- `/home/user`: `echo ${HOME}`

## Ports

- MPD: 6600
- HTTP: 8000

## Volumes

User:Group=HOST_UID:HOST_GID

- Music directory: /mpd/music
- Playlist directory: /mpd/playlists
- Log: /mpd/log
