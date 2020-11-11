FROM golang

WORKDIR /tmp/stream

COPY . /tmp/stream


RUN go build -o /go/bin/event-stream cmd/main.go

CMD ["event-stream"]

