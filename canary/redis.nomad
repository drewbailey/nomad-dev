job "example" {
  datacenters = ["dc1"]

  group "cache1" {
    count = 1

    update {
      auto_revert       = false
      canary            = 1
      progress_deadline = "5m30s"
    }

    network {
      port "db" {
        to = 6379
      }
    }

    task "redis" {
      driver = "docker"

      env {
        foo = "bar"
      }

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

  group "cache2" {
    count = 10

    update {
      auto_revert       = false
      canary            = 1
      stagger           = "10s"
      progress_deadline = "5m30s"
    }

    network {
      port "db" {
        to = 6379
      }
    }

    task "redis" {
      driver = "docker"

      env {
        foo = "bz"
      }

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
