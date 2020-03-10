FROM debian:buster-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
&&  apt-get install -y \
        wget \
	gdebi \
	gnupg2 \
&&  wget --https-only \
        https://www.scootersoftware.com/bcompare-4.3.4.24657_amd64.deb \
&&  gdebi -n \
        bcompare-4.3.4.24657_amd64.deb \
&&  apt-get purge -y \
        wget \
	gdebi \
	gnupg2 \
&& rm -rf \
        bcompare-4.3.4.24657_amd64.deb \
	/var/lib/apt/{lists,log,cache}

RUN useradd -ms /bin/bash \
        app

USER app
WORKDIR /data

VOLUME /data
ENTRYPOINT ["/usr/bin/bcompare"]

