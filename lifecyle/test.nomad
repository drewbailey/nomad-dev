job "example" {
  datacenters = ["dc1"]

  update {
    health_check     = "checks"
    healthy_deadline = "30s"
  }

  group "cache" {
    network {
      port "db" {
        to = 6379
      }
    }

    task "poststop" {
      restart {
        attempts = 0
      }

      lifecycle {
        hook = "poststop"
      }

      driver = "docker"

      config {
        image   = "busybox:1"
        command = "/bin/sh"
        args    = ["local/poststop.sh"]
      }

      template {
        data = <<EOT
#!/bin/sh
          sleep 10
          exit 0
EOT

        destination = "local/poststop.sh"
      }

      resources {
        cpu    = 64
        memory = 64
      }
    }

    task "redis" {
      env {
        foo = "BARarata2"
        bar = "fooa"
      }

      driver = "docker"

      config {
        image = "redis:3.2"

        ports = ["db"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
      service {
        name = "global-redis-check"
        tags = ["global", "cache", "urlprefix-/redis"]
        port = "db"

        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
