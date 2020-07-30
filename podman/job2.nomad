job "redis2" {
  datacenters = ["dc1"]
  type        = "service"

  group "cache" {
    task "redis" {
      driver = "podman"

      env {
        foo2 = "bar2"
      }
      config {
        image = "docker://redis"
      }
    }
  }
}
