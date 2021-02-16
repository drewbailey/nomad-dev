job "example" {
  datacenters = ["dc1"]
  group "foo" {
    scaling {
      enabled = false
      min     = 1
      max     = 20
      type    = "horizontal"
      policy {
        cooldown = "20s"
        check "avg_instance_sessions" {
          source = "prometheus"
          query  = "query"
          strategy "target-value" {
            target = 5
          }
        }
      }
    }
    task "foo" {
      driver = "raw_exec"
      config {
        command = "/bin/sleep"
        args    = ["10"]
      }
      scaling "cpu" {
        policy {
          check "check" {
            query = "query"
          }
        }
      }
      scaling "mem" {
        policy {
          check "check" {
            query = "query"
          }
        }
      }
    }
  }
}
