FROM t4skforce/docker-novnc:latest

ARG BUILD_DATE="2024-07-01T15:04:18Z"

RUN set -xe && \
    apt-get update -y && \
    apt-get install -y thunderbird && \
    rm -rf /var/lib/apt/lists && \
    mkdir -p ${HOME}/Thunderbird && \
    chown -R app:app ${HOME}/Thunderbird && \
    find /usr/share/applications/ -type f -not -name 'tint2.desktop' -delete
COPY ./templates/. /
VOLUME ${HOME}/Thunderbird
