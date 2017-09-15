FROM sergef/docker-library-alpine:edge

ENV GOPATH /go

ENV SRCROOT /go/src/github.com/tmp/goapp

ONBUILD COPY . ${SRCROOT}

ONBUILD RUN apk add --no-cache \
    g++ \
    git \
    go@community \
  && cd ${SRCROOT} \
  && go get \
  && go build -o /bin/goapp \
  && chmod +x /bin/goapp \
  && apk del --no-cache \
    g++ \
    git \
    go \
  && rm -rf \
    /go \
    /var/cache/apk/*

ONBUILD ENTRYPOINT ["tini", "--", "/bin/goapp"]
