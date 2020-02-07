job "failing-nomad-test01" {
  datacenters = ["dc1"]
  type        = "service"

  constraint {
    attribute = "${meta.tag}"
    value     = "foo"
  }

  update {
    health_check      = "checks"
    max_parallel      = 4
    min_healthy_time  = "10s"
    healthy_deadline  = "3m"
    progress_deadline = "10m"
    auto_revert       = false
    auto_promote      = false
    canary            = 4
  }

  migrate {
    max_parallel     = 3
    health_check     = "checks"
    min_healthy_time = "10s"
    healthy_deadline = "5m"
  }

  group "group" {
    count = 4

    restart {
      attempts = 0
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }

    ephemeral_disk {
      size = 300
    }

    task "rails" {
      driver = "docker"

      env {
        RAILS_ENV                = "production"
        RAILS_SERVE_STATIC_FILES = "1"
        RAILS_LOG_TO_STDOUT      = "1"
        TEST                     = "2020-01-09 01:23:18 +0000"
        version                  = "129"
      }

      config {
        image = "kaspergrubbe/diceapp:0.0.6"

        command = "bundle"
        args    = ["exec", "unicorn", "-c", "/app/config/unicorn.rb"]

        port_map {
          web = 8080
        }
      }

      resources {
        cpu    = 750
        memory = 250

        network {
          mbits = 50
          port  "web" {}
        }
      }

      service {
        name = "failing-nomad-test00"
        tags = []
        port = "web"

        check {
          name     = "failing-nomad-test00 healthcheck"
          type     = "http"
          protocol = "http"
          path     = "/"
          interval = "5s"
          timeout  = "3s"
        }
      }
    }
  }
}
