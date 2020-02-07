job "redis" {
  datacenters = ["dc1"]

  type = "system"

  # type = "service"
  group "cache2" {
    constraint {
      attribute = "${node.class}"
      value     = "class-2"
    }

    count = 1

    restart {
      attempts = 10
      interval = "5m"

      delay = "25s"
      mode  = "delay"
    }

    ephemeral_disk {
      size = 10
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"

        port_map {
          db = 6379
        }
      }

      env {
        version = "2"
      }

      logs {
        max_files     = 1
        max_file_size = 9
      }

      resources {
        cpu = 20 # 500 MHz    

        memory = 40 # 256MB

        network {
          mbits = 1
          port  "db"  {}
        }
      }
    }
  }

  group "cache" {
    constraint {
      attribute = "${node.class}"
      value     = "class-1"
    }

    count = 1

    restart {
      attempts = 10
      interval = "5m"

      delay = "25s"
      mode  = "delay"
    }

    ephemeral_disk {
      size = 10
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:3.2"

        port_map {
          db = 6379
        }
      }

      env {
        version = "2"
      }

      logs {
        max_files     = 1
        max_file_size = 9
      }

      resources {
        cpu = 20 # 500 MHz    

        memory = 40 # 256MB

        network {
          mbits = 1
          port  "db"  {}
        }
      }
    }
  }
}
