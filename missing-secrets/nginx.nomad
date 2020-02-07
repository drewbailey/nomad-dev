job "web" {
  datacenters = ["dc1"]

  group "web" {
    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:alpine"
        port_map {
          http = 80
        }
      }

      resources {
        cpu    = 500
        memory = 256
        network {
          mbits = 10
          port "http" {}
        }
      }

      template {
        change_mode = "restart" 
        destination = "local/services.env"
        splay = "0s"
        env = true,
        data = <<EOH
           {{ range service "redis" }}
             UPSTREAM_REDIS_HOST="{{ .Address }}"
             UPSTREAM_REDIS_PORT="{{ .Port }}"
           {{ end }}
           {{ range service "postgres" }}
             UPSTREAM_PSQL_HOST="{{ .Address }}"
             UPSTREAM_PSQL_PORT="{{ .Port }}"
           {{ end }}
        EOH
      }
    }
  }
}
