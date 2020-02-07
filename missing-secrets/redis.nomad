job "cache" {
  datacenters = ["dc1"]

  group "cache" {

    restart {
      attempts = 100
      delay = "3s"
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"
        port_map {
          db = 6379
        }
      }

      resources {
        cpu    = 500
        memory = 256
        network {
          mbits = 10
          port "db" {}
        }
      }

      service {
        name = "redis"
        tags = ["global", "cache"]
        port = "db"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
