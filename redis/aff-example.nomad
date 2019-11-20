job "example" {
  datacenters = ["dc1"]

  # constraint {
  #   attribute = "${meta.tag}"
  #   value     = "bar"
  # }

  update {
    stagger      = "1s"
    max_parallel = 2
  }
  group "cache" {
    count = 5

    task "redis" {
      driver = "docker"

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
          port  "db"  {}
        }
      }
    }
  }
}
