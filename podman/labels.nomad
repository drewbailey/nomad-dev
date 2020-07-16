
job "redis" {
  datacenters = ["dc1"]
  type        = "service"

  group "redis" {
    task "redis" {
      driver = "podman"

      config {
        image = "docker://redis"
        labels {
          group = "Drew"
        }

        tmpfs = ["/drewtest:rw,size=78744k"]
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

# sudo podman exec ae125 df -T /drewtest
