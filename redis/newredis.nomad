job "example" {
  datacenters = ["dc1"]

  group "cache" {
    service {
      name      = "some-service"
      on_update = "ignore_warnings"
    }
    network {
      port "db" {
        to = 6379
      }
    }

    task "redis" {
      driver = "docker"

      env {
        foo = "bar2"
        a   = "2"
      }

      config {
        image = "redis:3.2"

        ports = ["db"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
