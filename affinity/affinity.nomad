job "web" {
  datacenters = ["dc1"]
  type        = "service"

  update {
    max_parallel = 0
  }

  # affinity {
  #   attribute = "${meta.tag}"
  #   value     = "foo"
  #   weight    = 100
  # }

  # affinity {
  #   attribute = "${node.class}"
  #   value     = "class-1"
  #   weight    = 100
  # }
  meta {
    my-key = "my-value-other"
  }
  group "group" {
    count = 20

    task "server" {
      env {
        HTTP_PORT = "${NOMAD_PORT_http}"
        change    = "thisa"
        this      = "that"
        version   = "14"
      }

      driver = "docker"

      config {
        image = "drewbailey/simple-server:1"
      }

      resources {
        network {
          mbits = 10
          port  "http"{}
        }
      }
    }
  }
}
