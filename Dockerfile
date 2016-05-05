FROM alpine:latest

MAINTAINER Gerard Lynch <gerard@halberom.co.uk>
LABEL Description="This image provides the 'eyaml' command"

RUN apk add --update ruby && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["eyaml"]
