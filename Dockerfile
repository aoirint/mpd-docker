FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
ENV MPD_PASSWORD=password@read,add,control,admin

RUN apt-get update && \
    apt-get install -y \
        mpd \
        pulseaudio \
        gettext-base \
        gosu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 -o user

RUN mkdir -p /mpd /mpd/db /mpd/pid /mpd/state /mpd/sticker /mpd/log /mpd/music /mpd/playlists
ADD ./mpd.conf /mpd/mpd.conf.template
RUN chown -R user:user /mpd /mpd/db /mpd/pid /mpd/state /mpd/sticker /mpd/log /mpd/music /mpd/playlists

ADD ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "gosu", "user", "/usr/bin/mpd", "--no-daemon", "/mpd/mpd.conf" ]
