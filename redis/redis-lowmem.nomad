job "example2" {
  datacenters = ["dc1"]

  group "cache" {
    count = 3
    task "redis" {
      driver = "docker"

      env {
        foo2 = "bar2"
      }

      config {
        image = "redis:3.2"

        port_map {
          db = 6379
        }
      }

      resources {
        cpu    = 5
        memory = 10

        network {
          mbits = 10
          port "db" {}
        }
      }
    }
  }
}
