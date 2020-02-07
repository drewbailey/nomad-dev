job "j_uptime" {
  datacenters = ["dc1"]
  type        = "batch"

  constraint {
    attribute = "${attr.kernel.name}"
    value     = "linux"
  }

  constraint {
    attribute = "${node.class}"
    value     = "class-2"
  }

  group "g_uptime" {
    count = 1

    task "t_uptime" {
      driver = "raw_exec"

      config {
        command = "/usr/bin/uptime"
      }
    }
  }
}
