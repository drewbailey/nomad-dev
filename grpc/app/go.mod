module github.com/drewbailey/grpc-job

replace github.com/hashicorp/nomad => ../../../go/nomad

go 1.15

require (
	github.com/hashicorp/go-hclog v0.12.0
	github.com/hashicorp/nomad v0.12.8
)
