#!/bin/bash

envsubst '${MPD_PASSWORD}' < /etc/mpd.conf > /etc/mpd.conf

exec $@
