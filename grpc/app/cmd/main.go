package main

import (
	"context"
	"os"
	"os/signal"
	"syscall"

	"github.com/hashicorp/go-hclog"
	"github.com/hashicorp/nomad/nomad"
	pbstream "github.com/hashicorp/nomad/nomad/stream/proto"
)

func main() {

	log := hclog.NewInterceptLogger(
		&hclog.LoggerOptions{
			Output: os.Stdout,
			Level:  hclog.Trace,
		},
	)

	rpcAddr := os.Getenv("RPC_ADDR")
	if rpcAddr == "" {
		rpcAddr = "127.0.0.1:4647"
	}
	log.Debug("configuring rpc client with addr", "addr", rpcAddr)

	sigCh := make(chan os.Signal, 1)
	signal.Notify(sigCh,
		syscall.SIGHUP,
		syscall.SIGINT,
		syscall.SIGTERM,
		syscall.SIGQUIT)

	ctx, cancel := context.WithCancel(context.Background())
	go func() {
		<-sigCh
		cancel()
	}()

	clientPool := nomad.ClientConnPool{}
	conn, err := clientPool.ClientConn(rpcAddr)
	if err != nil {
		log.Error("error retrieving client connection", "error", err)
		os.Exit(1)
	}

	c := pbstream.NewEventStreamClient(conn)
	sub, err := c.Subscribe(ctx, &pbstream.SubscribeRequest{
		Index: 0,
		Topics: []*pbstream.TopicFilter{
			{Topic: pbstream.Topic_All},
		},
	})
	if err != nil {
		log.Error("error creating grpc stream", "error", err)
		os.Exit(1)
	}

	for {
		select {
		case <-ctx.Done():
			log.Info("exiting..")
			os.Exit(0)
		default:
		}

		batch, err := sub.Recv()
		if err != nil {
			log.Error("error retrieving events", "error", err)
			os.Exit(1)
		}
		for _, e := range batch.Event {
			log.Info("received event from grpc stream", "event", e)
		}
	}
}
