job "example-job" {
  datacenters = ["dc1"]

  group "example-service-api-group" {
    service {
      name = "example-service"
      port = "8080"

      check {
        type     = "http"
        path     = "/"
        interval = "5s"
        timeout  = "1s"
      }
    }

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
