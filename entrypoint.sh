#!/bin/bash

set -eu

USER_NAME=user

usermod -u "${HOST_UID}" -o "${USER_NAME}"
groupmod -g "${HOST_GID}" -o "${USER_NAME}"

mkdir -p /mpd /mpd/db /mpd/pid /mpd/state /mpd/sticker /mpd/log /mpd/music /mpd/playlists
chown "${USER_NAME}:${USER_NAME}" /mpd /mpd/db /mpd/pid /mpd/state /mpd/sticker /mpd/log /mpd/music /mpd/playlists

gosu "${USER_NAME}" mkdir -p "/home/${USER_NAME}/.config/pulse"
if [ -f /pulseaudio/cookie ]; then
  ln -s /pulseaudio/cookie "/home/${USER_NAME}/.config/pulse/cookie"
fi

gosu "${USER_NAME}" envsubst '${MPD_PASSWORD}' < /mpd/mpd.conf.template > /mpd/mpd.conf

exec $@
