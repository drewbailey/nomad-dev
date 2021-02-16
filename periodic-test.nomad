job "j5" {
  datacenters = ["dc1"]
  type        = "batch"

  periodic {
    cron             = "*/1 * * * * *"
    prohibit_overlap = false
    time_zone        = "UTC"
  }

  group "g5" {
    network {
      port "p5" {
        to = 6379
      }
    }
    task "t5" {
      driver = "docker"

      config {
        image = "redis:3.2"
        ports = ["p5"]
      }

    }
  }
}
