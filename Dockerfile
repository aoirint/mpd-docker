FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
ENV MPD_PASSWORD=password@read,add,control,admin

RUN apt-get update && \
    apt-get install -y \
        mpd \
        gettext-base \
        gosu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 -o user

ADD ./mpd.conf /etc/mpd.conf

ADD ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "/usr/bin/mpd", "--no-daemon" ]
