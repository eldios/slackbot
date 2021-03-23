# BUILDER

FROM golang:1.15 AS builder
RUN go version

RUN set -x && \
    go get github.com/golang/dep/cmd/dep 

COPY  . /go/src/github.com/eldios/slackbot
WORKDIR /go/src/github.com/eldios/slackbot

RUN set -x && \
    dep ensure -v

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o slackbot .

# RUNTIME
FROM alpine

WORKDIR /bot/

COPY --from=builder /go/src/github.com/eldios/slackbot/slackbot ./

ENTRYPOINT [ "./slackbot" ]
