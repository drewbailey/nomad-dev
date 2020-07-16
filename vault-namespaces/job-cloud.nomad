job "vault-cloud" {
  datacenters = ["dc1"]

  group "demo" {
    task "task" {
      vault {
        namespace = "engineering/cloud"
        policies  = ["access-kv"]
      }

      driver = "raw_exec"
      config {
        command = "/usr/bin/cat"
        args    = ["secrets/config.txt"]
      }

      template {
        data        = <<EOF
{{ with secret "secret/foo" }}
SOME_VAL={{.Data.bar}}
{{ end }}
EOF
        destination = "secrets/config.txt"
      }
    }
  }
}

