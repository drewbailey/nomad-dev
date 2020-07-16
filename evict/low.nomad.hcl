job "evict" {
  type        = "batch"
  datacenters = ["dc1"]

  priority = 10

  # constraint {
  #   attribute = "${meta.tag}"
  #   value     = "foo"
  # }

  group "api" {
    count = 1

    task "low" {
      resources {
        memory = "2000"
      }

      shutdown_delay = "10s"

      service {
        name = "test"
      }

      driver = "raw_exec"

      config {
        command = "/bin/sleep"

        args = [
          "1000000",
        ]
      }
    }
  }
}
