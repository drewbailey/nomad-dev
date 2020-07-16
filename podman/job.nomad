job "device" {
  datacenters = ["dc1"]
  type        = "service"

  group "cache" {
    task "redis" {
      driver = "podman"

      config {
        image = "docker://redis"
      }

      resources {
        device "example" {
          count = 1
        }
      }
    }
  }
}
