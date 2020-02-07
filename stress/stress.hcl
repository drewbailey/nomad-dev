job "stress" {
  datacenters = ["dc1"]

  group "stress" {
    count = 1

    task "redis" {
      driver = "docker"

      config {
        image   = "polinux/stress"
        command = "stress"

        args = [
          "--cpu",
          "1",
          "--io",
          "1",
          "--vm",
          "2",
          "--vm-bytes",
          "128M",
        ]
      }

      resources {
        # cpu    = 500  # memory = 256  # network {  #   mbits = 10  #   port  "db"  {}  # }
      }
    }
  }
}
