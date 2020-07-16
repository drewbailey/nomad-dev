job "nginx" {
  datacenters = ["dc1"]

  group "nginx" {
    reschedule {
      attempts  = 0
      unlimited = false
    }

    task "web" {
      driver = "podman"

      config {
        image = "nginx"

        port_map {
          http = 80
        }
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB

        network {
          mbits = 10
          port "http" {}
        }
      }

      service {
        name = "nginx"
        port = "http"

        check {
          name     = "alive"
          type     = "http"
          path     = "/"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
