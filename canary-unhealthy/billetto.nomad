job "web" {
  datacenters = ["dc1"]
  type        = "service"

  update {
    max_parallel      = 4
    min_healthy_time  = "10s"
    healthy_deadline  = "30s"
    progress_deadline = "5m"
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

    # restart {
    #   attempts = 0
    #   interval = "30m"
    #   delay    = "15s"
    #   mode     = "fail"
    # }
    restart {
      attempts = 0
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }

    ephemeral_disk {
      size = 300
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx"

        port_map {
          http = 80
        }

        volumes = [
          "local:/etc/nginx/conf.d",
        ]
      }

      template {
        data = <<EOF

  FAILFAILAIFA

server {
   listen {{ env "NOMAD_PORT_nginx" }};
   location /nginx_health {
      return 200 'nginx health';
   }

}
EOF

        destination = "local/load-balancer.conf"

        change_mode   = "signal"
        change_signal = "SIGHUP"
      }

      resources {
        memory = 1300

        network {
          mbits = 10
          mode  = "host"

          port "nginx" {
            # static = 8080
          }
        }
      }

      service {
        name = "nginx"
        tags = []
        port = "nginx"

        check {
          name     = "nginx healthcheck"
          type     = "http"
          protocol = "http"
          path     = "/nginx_health"
          interval = "5s"
          timeout  = "3s"
        }
      }
    }

    # task "server" {
    #   env {
    #     HTTP_PORT = "${NOMAD_PORT_web}"
    #     version   = 6
    #   }

    #   driver = "docker"

    #   config {
    #     image = "drewbailey/simple-server:1"

    #     port_map = {
    #       # web = 3000
    #     }
    #   }

    #   resources {
    #     network {
    #       mbits = 10
    #       port  "web" {}
    #     }
    #   }

    #   service {
    #     name = "demo-webapp"
    #     tags = []
    #     port = "web"

    #     check {
    #       name     = "web healthcheck"
    #       type     = "http"
    #       protocol = "http"
    #       path     = "/healthcheck"
    #       interval = "5s"
    #       timeout  = "3s"
    #     }
    #   }
    # }
  }
}
