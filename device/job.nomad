job "device" {
  datacenters = ["dc1"]

  group "cache" {
    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"
      }

      resources {
        device "example" {
          count = 4
        }
      }
    }
  }
}
