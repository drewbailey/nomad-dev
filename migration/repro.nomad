job "web" {
  datacenters = ["dc1"]
  type        = "service"

  update {
    max_parallel      = 1
    min_healthy_time  = "20s"
    healthy_deadline  = "4m"
    progress_deadline = "10m"
    auto_revert       = false
    canary            = 0
  }

  migrate {
    max_parallel     = 1
    health_check     = "checks"
    min_healthy_time = "50s"
    healthy_deadline = "15m"
  }

  affinity {
    attribute = "${meta.tag}"
    value     = "foo"
    weight    = 100
  }

  affinity {
    attribute = "${node.class}"
    value     = "class-1"
    weight    = 100
  }

  group "group" {
    count = 2

    task "server" {
      env {
        HTTP_PORT = "${NOMAD_PORT_http}"
        change    = "this"
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

        check {
          type     = "http"
          path     = "/healthcheck"
          interval = "2s"
          timeout  = "2s"
        }
      }
    }
  }
}
