job "database" {
  datacenters = ["dc1"]

  group "database" {

    restart {
      attempts = 100
      delay = "3s"
    }

    task "postgres" {
      driver = "docker"

      config {
        image = "postgres"
        port_map {
          db = 5432
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
        name = "postgres"
        tags = ["global", "postgres"]
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
