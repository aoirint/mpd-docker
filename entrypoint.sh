#!/bin/bash

envsubst '${MPD_PASSWORD}' < /etc/mpd.conf.template > /etc/mpd.conf

exec $@
