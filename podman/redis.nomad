job "redis" {
  datacenters = ["dc1"]
  type        = "service"

  group "redis" {
    task "redis" {
      driver = "podman"

      config {
        image = "redis:3.2"

        tmpfs = ["/var"]
        port_map {
          redis = 6379
        }
      }

      resources {
        cpu = 500

        network {
          mbits = 20
          port "redis" {}
        }
      }
    }
  }
}
