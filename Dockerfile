FROM sergef/docker-library-alpine:edge

ENV GOPATH /go

RUN apk add --no-cache \
  g++ \
  git \
  go@community

ONBUILD ENV SRCROOT /go/src/github.com/tmp/goapp

ONBUILD WORKDIR /go/src/github.com/tmp/goapp

ONBUILD COPY . /go/src/github.com/tmp/goapp

ONBUILD RUN go get \
  && go build -o /bin/goapp \
  && chmod +x /bin/goapp \
