job "test" {
  datacenters = ["dc1"]

  group "test" {
    count = 1

    network {
      port "http" {
        to = "8080"
      }
    }

    update {
      health_check = "checks"
      stagger      = "10s"
    }

    service {
      name = "echo-service"
      port = "http"

      check {
        name     = "tcp_validate"
        type     = "tcp"
        port     = 6379
        interval = "10s"
        timeout  = "2s"
      }

      check {
        name     = "drew_update_test"
        type     = "script"
        command  = "/bin/bash"
        interval = "5s"
        timeout  = "2s"
        task     = "server"
        # on_update = "ignore"

        args = [
          "-c",
          "echo 'check something that warns'; exit 2;",
        ]

      }
    }

    # service {
    #   name      = "echo-deployment-ready"
    #   on_update = "ignore_warnings"

    #   check {
    #     name     = "echo-deployment-check"
    #     type     = "script"
    #     command  = "/bin/bash"
    #     interval = "5s"
    #     timeout  = "1s"
    #     task     = "server"

    #     args = [
    #       "-c",
    #       "/local/ready.sh"
    #     ]
    #   }
    # }


    task "server" {
      driver = "docker"

      env {
        b = "bar"
        v = "b"
      }

      config {
        image = "redis"
      }

      template {
        data = <<EOT
#!/bin/sh

if [ ! -f /tmp/deploy_1 ]; then touch /tmp/deploy_1; exit 1; fi
if [ ! -f /tmp/deploy_2 ]; then touch /tmp/deploy_2; exit 1; fi
if [ ! -f /tmp/deploy_3 ]; then touch /tmp/deploy_3; exit 1; fi
if [ ! -f /tmp/deploy_4 ]; then touch /tmp/deploy_4; exit 1; fi
if [ ! -f /tmp/deploy_5 ]; then touch /tmp/deploy_5; exit 1; fi
if [ ! -f /tmp/deploy_15 ]; then touch /tmp/deploy_15; exit 7; fi
if [ ! -f /tmp/deploy_16 ]; then touch /tmp/deploy_16; exit 7; fi
if [ ! -f /tmp/deploy_17 ]; then touch /tmp/deploy_17; exit 7; fi
if [ ! -f /tmp/deploy_18 ]; then touch /tmp/deploy_18; exit 7; fi


if [ -f tmp/deploy_18 ]; then exit 7; fi
EOT

        destination = "local/ready.sh"
        perms       = "777"

      }
    }
  }
}

# service {
#   name      = "echo-on-update-service"
#   port      = "http"
#   on_update = "ignore_warnings"


#   check {
#     name     = "drew_update_test"
#     type     = "script"
#     command  = "/bin/bash"
#     interval = "30s"
#     timeout  = "10s"
#     task     = "server"

#     args = [
#       "-c",
#       "echo 'check something that warns'; exit 1;",
#     ]

#   }
# }


# if [ ! -f /tmp/deploy_1 ]; then touch /tmp/deploy_1; exit 1; fi
# if [ ! -f /tmp/deploy_2 ]; then touch /tmp/deploy_2; exit 1; fi
# if [ ! -f /tmp/deploy_3 ]; then touch /tmp/deploy_3; exit 1; fi
# if [ ! -f /tmp/deploy_4 ]; then touch /tmp/deploy_4; exit 1; fi
# if [ ! -f /tmp/deploy_5 ]; then touch /tmp/deploy_5; exit 1; fi
# if [ ! -f /tmp/deploy_6 ]; then touch /tmp/deploy_6; exit 1; fi
# if [ ! -f /tmp/deploy_7 ]; then touch /tmp/deploy_7; exit 1; fi
# if [ ! -f /tmp/deploy_8 ]; then touch /tmp/deploy_8; exit 1; fi
# if [ ! -f /tmp/deploy_9 ]; then touch /tmp/deploy_9; exit 0; fi
# if [ ! -f /tmp/deploy_10 ]; then touch /tmp/deploy_10; exit 0; fi
# if [ ! -f /tmp/deploy_11 ]; then touch /tmp/deploy_11; exit 0; fi
# if [ ! -f /tmp/deploy_11 ]; then touch /tmp/deploy_11; exit 0; fi
# if [ ! -f /tmp/deploy_12 ]; then touch /tmp/deploy_12; exit 0; fi
# if [ ! -f /tmp/deploy_14 ]; then touch /tmp/deploy_14; exit 1; fi
# if [ ! -f /tmp/deploy_15 ]; then touch /tmp/deploy_15; exit 1; fi
# if [ ! -f /tmp/deploy_16 ]; then touch /tmp/deploy_16; exit 1; fi


# if [ ! -f /tmp/deploy_1 ]; then touch /tmp/deploy_1; exit 1; fi
# if [ ! -f /tmp/deploy_2 ]; then touch /tmp/deploy_2; exit 1; fi
# if [ ! -f /tmp/deploy_3 ]; then touch /tmp/deploy_3; exit 1; fi
# if [ ! -f /tmp/deploy_4 ]; then touch /tmp/deploy_4; exit 1; fi
# if [ ! -f /tmp/deploy_5 ]; then touch /tmp/deploy_5; exit 1; fi
# if [ ! -f /tmp/deploy_6 ]; then touch /tmp/deploy_6; exit 1; fi
# if [ ! -f /tmp/deploy_7 ]; then touch /tmp/deploy_7; exit 1; fi
# if [ ! -f /tmp/deploy_8 ]; then touch /tmp/deploy_8; exit 1; fi
# if [ ! -f /tmp/deploy_9 ]; then touch /tmp/deploy_9; fi


# if [ -f tmp/deploy_9 ]; then exit 0; fi
