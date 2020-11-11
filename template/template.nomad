job "example" {
  datacenters = ["dc1"]

  group "cache" {
    task "redis" {
      driver = "docker"

      template {
        data        = "---\nkey: {{ key \"service/my-key\" }}"
        destination = "local/file.yml"
      }
      template {
        data        = <<EOF
          "{{with secret " secret / data / aws / s3 "}}{{.Data.data.aws_access_key_id}}{{end}}"
          EOF
        destination = "${NOMAD_SECRETS_DIR}/ca.crt"
        change_mode = "restart"
      }
      config {
        image = "redis:3.2"

        port_map {
          db = 6379
        }
      }

      resources {
        cpu    = 500
        memory = 256

        network {
          mbits = 10
          port "db" {}
        }
      }
    }
  }
}
