job "example-job-system" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "system"

  group "example-service-api-group" {
    count = 1

    network {
      mode = "bridge"
    }

    # service {
    #   name = "example-test-two"
    #   port = "8082"
    # }

    # service {
    #   name = "example-system-service"
    #   port = "8082"
    #   tags = ["http", "example-v10"]
    # }

    task "example-fake" {
      driver = "docker"

      config {
        image = "nicholasjackson/fake-service:v0.12.0"
      }

      env {
        LISTEN_ADDR = "0.0.0.0:8080"
      }
    }
  }
}
