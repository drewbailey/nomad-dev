job "web" {
  datacenters = ["dc1"]
  type        = "service"

  update {
    max_parallel      = 4
    min_healthy_time  = "10s"
    healthy_deadline  = "3m"
    progress_deadline = "10m"
    auto_revert       = false
    auto_promote      = false
    canary            = 4
  }

  migrate {
    max_parallel     = 3
    health_check     = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }

  group "group" {
    count = 4

    restart {
      attempts = 0
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }

    ephemeral_disk {
      size = 300
    }

    task "server" {
      env {
        HTTP_PORT = "${NOMAD_PORT_http}"
        version   = "4"
      }

      driver = "docker"

      config {
        image = "drewbailey/simple-server:1"
      }

      resources {
        network {
          mbits = 10
          port  "http"{}
        }
      }

      service {
        name = "demo-webapp"
        port = "http"

        canary_meta = {
          thing = "value"
        }

        check {
          type     = "http"
          path     = "/healthcheck"
          interval = "5s"
          timeout  = "3s"
        }
      }
    }
  }
}
