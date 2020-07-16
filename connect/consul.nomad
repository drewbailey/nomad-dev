job "delay" {
  datacenters = ["dc1"]

  group "api" {
    # shutdown_delay = "30s"

    meta {
      foo = "bar3"
    }

    service {
      tags = ["group"]
    }

    spread {
      attribute = "${node.datacenter}"

      target "dc1" {
        percent = 100
      }
    }

    task "web" {
      driver = "docker"

      shutdown_delay = "10s"

      config {
        image = "hashicorpnomad/counter-api:v1"
      }

      service {
        tags = ["awesome"]
      }
    }

    task "dashboard" {
      driver = "docker"

      shutdown_delay = "60s"

      env {
        COUNTING_SERVICE_URL = "http://${NOMAD_UPSTREAM_ADDR_count_api}"
      }

      config {
        image = "hashicorpnomad/counter-dashboard:v1"
      }

      service {
        tags = ["dashboard-service"]
      }
    }
  }
}
