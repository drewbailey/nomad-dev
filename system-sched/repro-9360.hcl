job "example-system-job" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "example-service-api-group" {
    count = 1

    network {
      port api {}
    }

    service {
      name = "example-service-1"
      port = "api"
    }

    # service {
    #   name = "example-service-2"
    #   port = "api"
    # }


    task "example-fake" {
      driver = "docker"

      config {
        image = "nicholasjackson/fake-service:v0.12.0"
      }

      env {
        LISTEN_ADDR = "0.0.0.0:${NOMAD_PORT_api}"
      }
    }
  }
}

