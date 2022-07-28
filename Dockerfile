FROM debian:buster-slim
ARG DEBIAN_FRONTEND=noninteractive
ARG BEYOND_COMPARE_VERSION=4.4.3.26655
ARG BEYOND_COMPARE_ARCH=amd64

RUN apt-get update \
&&  apt-get install -y --no-install-recommends wget gdebi ca-certificates gnupg2 tini \
&&  wget --https-only \
        "https://www.scootersoftware.com/bcompare-${BEYOND_COMPARE_VERSION}_${BEYOND_COMPARE_ARCH}.deb" \

&&  gdebi -n bcompare-${BEYOND_COMPARE_VERSION}_${BEYOND_COMPARE_ARCH}.deb \
&&  apt-get purge -y ca-certificates wget gdebi gnupg2 \
&&  rm -rf \
      "bcompare-${BEYOND_COMPARE_VERSION}_${BEYOND_COMPARE_ARCH}.deb" \
	  /var/lib/apt/{lists,log,cache}
RUN useradd -ms /bin/bash app

USER app
WORKDIR /data
VOLUME /data
ENTRYPOINT ["/usr/bin/tini", "-vv", "--", "/usr/bin/bcompare"]
