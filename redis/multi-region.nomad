# There can only be a single job definition per file. This job is named
# "redis" so it will create a job with the ID and Name "redis".

# The "job" stanza is the top-most configuration option in the job
# specification. A job is a declarative specification of tasks that Nomad
# should run. Jobs have a globally unique name, one or many task groups, which
# are themselves collections of one or many tasks.
#
# For more information and rediss on the "job" stanza, please see
# the online documentation at:
#
#     https://www.nomadproject.io/docs/job-specification/job.html
#
job "redis" {
  multiregion {
    strategy {
      max_parallel = 1
      auto_revert  = "all"
    }
    regions = [
      "philly" {
        count       = 1
        datacenters = ["dc1"]
      },
      "philly2" {
        count      = 1
        datacenter = ["dc1"]
      },
    ]
  }
  type = "service"
  group "cache" {
    count = 1

    restart {
      attempts = 10
      interval = "5m"
      delay    = "25s"
      mode     = "delay"
    }

    ephemeral_disk {
      size = 10
    }
    task "redis" {
      env {
        version = "2"
      }

      driver = "docker"
      config {
        image = "redis:3.2"

        port_map {
          db = 6379
        }
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
          port "db" {}
        }
      }
      service {
        name = "global-redis-check"
        tags = ["global", "cache", "urlprefix-/redis"]
        port = "db"

        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }

    }
  }
}
