#FROM alpine:3.2
FROM debian:jessie
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

#RUN apk add --update \
#      curl \
#      && rm -rf /var/cache/apk/*


RUN apt-get update && apt-get install -y \
      curl \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/*

ENV SYNCTHING_VERSION 0.12.2

RUN curl -L https://github.com/syncthing/syncthing/releases/download/v${SYNCTHING_VERSION}/syncthing-linux-amd64-v${SYNCTHING_VERSION}.tar.gz | tar xvz -C /usr/bin --strip-components=1 syncthing-linux-amd64-v${SYNCTHING_VERSION}/syncthing

CMD /usr/bin/syncthing
