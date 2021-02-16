job "traefik" {
  datacenters = ["dc1"]

  type = "system"

  group "container" {
    count = 1

    update {
      max_parallel     = 1
      min_healthy_time = "30s"
      healthy_deadline = "5m"

      auto_revert = true
    }

    network {
      port "http" {
        to     = 80
        static = 80
      }
    }

    restart {
      attempts = 5
      delay    = "15s"
    }

    task "container" {
      driver = "docker"

      service {
        name = "traefik"
        port = "http"

        tags = ["traefik.enabled=true"]

        meta {
          type  = "lb"
          thing = "foobarz"
        }
      }

      config {
        image = "traefik"

        ports = ["http"]
      }

      env {
        VERSION              = "2"
        TRAEFIK_API          = "true"
        TRAEFIK_API_INSECURE = "true"

        TRAEFIK_ENTRYPOINTS_HTTP    = ":80"
        TRAEFIK_ENTRYPOINTS_TRAEFIK = ":8080"

        TRAEFIK_PROVIDERS_CONSULCATALOG                  = "true"
        TRAEFIK_PROVIDERS_CONSULCATALOG_ENDPOINT_ADDRESS = "${attr.unique.network.ip-address}:8500"
      }

      resources {
        cpu    = 200
        memory = 64
      }

    }
  }
}
