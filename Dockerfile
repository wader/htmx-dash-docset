FROM alpine:3.17
RUN apk add \
    build-base \
    git \
    go \
    graphicsmagick \
    jq \
    zola

RUN \
    go install github.com/technosophos/dashing@master && \
    cp $(go env GOPATH)/bin/dashing /usr/local/bin

ENTRYPOINT ./generate.sh
