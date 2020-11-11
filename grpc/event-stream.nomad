job "example" {
  datacenters = ["dc1"]

  group "group" {
    # network {
    #   mode = "host"
    # }

    task "stream" {
      driver = "docker"

      env {
        RPC_ADDR = "localhost:4647"
      }

      config {
        image        = "drewbailey.localhost/stream:local"
        network_mode = "host"
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
