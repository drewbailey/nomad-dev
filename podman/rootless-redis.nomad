job "example" {
  datacenters = ["dc1"]
  type        = "service"

  group "cache" {
    count = 1
    restart {
      attempts = 2
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }
    task "redis" {
      driver = "podman"

      config {
        image        = "redis"
        network_mode = "slirp4netns"

        port_map {
          db = 6379
        }

        volumes = [
          "/home/drew/work/nomad-dev/podman:/mnt/local",
        ]
      }

      resources {
        cpu    = 200 # 500 MHz
        memory = 100 # 100MB

        network {
          mbits = 10
          port "db" {}
        }
      }
    }
  }
}
