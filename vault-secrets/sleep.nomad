job "sleep" {
  datacenters = ["dc1"]
  type        = "batch"

  group "example" {
    task "sleeper" {
      # template {
      #   data        = <<EOH
      #     {{ with secret "secrets/4044" }}{{ .Data.certificate }}{{ end }}
      #   EOH
      #   destination = "secrets/test.pem"
      # }

      driver = "exec"

      config {
        command = "/bin/sleep"
        args    = ["3600"]
      }
      resources {
        memory = 10
        cpu    = 20
      }
    }
  }
}
