job "web" {
  datacenters = ["dc1"]
  type        = "service"

  update {
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
upstream backend {
{{ range service "demo-webapp" }}
  server {{ .Address }}:{{ .Port }};
{{ else }}server 127.0.0.1:65535; # force a 502
{{ end }}
}

server {
   listen {{ env "NOMAD_PORT_nginx" }};

   location /nginx_health {
      return 200 'nginx health';
   }
   

   location / {
      proxy_pass http://backend;
   }
}
EOF

        destination   = "local/load-balancer.conf"
        change_mode   = "signal"
        change_signal = "SIGHUP"
      }

      resources {
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
          path     = "/healthcheck"
          interval = "5s"
          timeout  = "3s"
        }
      }
    }

    task "server" {
      env {
        HTTP_PORT = "${NOMAD_PORT_http}"
      }

      driver = "docker"

      config {
        image = "drewbailey/simple-server:fail"
      }

      resources {
        network {
          mbits = 10
          port  "http"{}
        }
      }

      service {
        name = "demo-webapp"
        port = "http"

        check {
          type     = "http"
          path     = "/healthcheck"
          interval = "5s"
          timeout  = "3s"
        }
      }
    }
  }
}
