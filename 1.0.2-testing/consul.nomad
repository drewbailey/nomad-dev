job "echo" {
  datacenters = ["dc1"]

  group "web" {
    network {
      port "http" {
        to = 5678
      }
    }

    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        args  = ["-text", "hello world"]
        ports = ["http"]
      }

      env {
        test = "bar"
      }

      service {
        name = "echo"
        port = "http"
      }
    }
  }
}
