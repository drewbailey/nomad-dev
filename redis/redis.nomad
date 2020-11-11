job "example-system" {
  datacenters = ["dc1"]
  type        = "system"
  group "cache" {
    scaling {
      enabled = true
      min     = 3
      max     = 10
      policy {
      }
    }
    task "redis" {
      driver = "docker"

      env {
        foo = "bar"
      }

      config {
        image = "redis:3.2"

        port_map {
          db = 6379
        }
      }
      resources {
        cpu    = 500
        memory = 256

        network {
          mbits = 10
          port "db" {}
        }
      }
    }
  }
}
