job "multiple" {
  datacenters = ["dc1"]

  group "activemq" {
    network {
      mode = "bridge"
    }

    service {
      name = "activemq-web"
      port = "8161"

      connect {
        sidecar_service {}
      }
    }

    service {
      name = "tcp"
      port = "61616"

      connect {
        sidecar_service {}
      }
    }

    service {
      name = "stomp"
      port = "61613"

      connect {
        sidecar_service {}
      }
    }

    task "activemq" {
      driver = "docker"

      config {
        image = "redis:3.2"
      }
    }
  }
}
