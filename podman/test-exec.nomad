job "execsleep" {
  type        = "service"
  datacenters = ["dc1"]

  group "api" {
    count = 1

    task "low" {
      resources {
        memory = "10"
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

