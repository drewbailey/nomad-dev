job "override" {
  type        = "batch"
  datacenters = ["dc1"]

  priority = 90

  # constraint {
  #   attribute = "${meta.tag}"
  #   value     = "foo"
  # }

  group "group" {
    task "high" {
      driver = "raw_exec"

      resources {
        memory = "15699"
      }

      config {
        command = "/bin/sleep"

        args = [
          "100000",
        ]
      }
    }
  }
}
