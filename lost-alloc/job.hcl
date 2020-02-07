job "test" {
  datacenters = ["dc1"]

  group "webservers" {
    count = 3

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:latest"

        port_map = {
          http = 80
        }
      }

      env {
        version = "1"
      }

      service {
        name = "nginx"
        port = "http"

        check {
          type     = "http"
          port     = "http"
          path     = "/"
          interval = "5s"
          timeout  = "3s"

          check_restart {
            limit           = 1
            grace           = "5s"
            ignore_warnings = false
          }
        }
      }

      resources {
        memory = 64

        network {
          mbits = 10
          port  "http"{}
        }
      }
    }

    restart {
      attempts = 0
      delay    = "10s"
    }

    update {
      max_parallel      = 3
      health_check      = "checks"
      min_healthy_time  = "5s"
      healthy_deadline  = "30s"
      progress_deadline = "2m"
      auto_revert       = false
      auto_promote      = false
      canary            = 3
    }
  }
}
