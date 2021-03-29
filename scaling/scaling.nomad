job "scaling" {
  datacenters = ["dc1"]

  group "cache" {
    network {
      port "db" {
        to = 6379
      }
    }

    scaling {
      enabled = "false"
      min     = 1
      max     = 10
      policy {
        evaluation_interval = "5s"
        cooldown            = "1m"

        target "target" {
          Job   = "example"
          Group = "example"
        }

        check "active_connections" {
          source = "prometheus"
          query  = "scalar(open_connections_example_cache)"

          strategy "target_value" {
            target = 10
          }
        }
      }
    }


    task "redis" {
      driver = "docker"

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
