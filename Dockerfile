FROM alpine:3.5
MAINTAINER tilldettmering@gmail.com

ENV HUGO_VERSION 0.36.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit

# Install HUGO
RUN set -x && \
  apk add --update wget ca-certificates && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz && \
  tar xzf ${HUGO_BINARY}.tar.gz && \
  rm -r ${HUGO_BINARY}.tar.gz && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*
