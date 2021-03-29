job "example" {
  datacenters = ["dc1"]

  group "cache" {
    network {
      port "db" {
        to = 6379
      }
    }

    volume "certs" {
      type      = "host"
      source    = "ca-certificates"
      read_only = true
    }

    volume "certstwo" {
      type      = "host"
      source    = "ca-certificates"
      read_only = true
    }

    task "redis" {
      driver = "docker"

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
