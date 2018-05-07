FROM alpine:3.5
MAINTAINER tilldettmering@gmail.com

ENV HUGO_VERSION 0.40.2
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

ENV MINIFY_VERSION 2.3.4
ENV MINIFY_BINARY minify_${MINIFY_VERSION}_linux_amd64.tar.gz

# Install HUGO
RUN set -x && \
  apk add --update wget ca-certificates && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
  tar xzf ${HUGO_BINARY} && \
  rm -r ${HUGO_BINARY} && \
  mv hugo /usr/bin

# Install MINIFY
RUN set -x && \
  wget https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/${MINIFY_BINARY} && \
  tar xzf ${MINIFY_BINARY} && \
  rm -r ${MINIFY_BINARY} && \
  mv minify /usr/bin && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*
