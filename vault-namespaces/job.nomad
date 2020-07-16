job "vault" {
  datacenters = ["dc1"]

  group "demo" {
    task "sleepr" {
      driver = "raw_exec"
      config {
        command = "/usr/bin/sleep"
        args    = ["1000"]
      }
      vault {
        # namespace = "engineering"
        policies = ["access-kv"]
      }
    }

    task "task" {
      lifecycle {
        hook = "prestart"
      }

      meta {
        this = "that"
      }
      vault {
        # namespace = "engineering"
        policies = ["access-kv"]
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

