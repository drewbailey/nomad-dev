job "example" {
  datacenters = ["dc1"]
  group "cache" {
    task "redis" {
      driver       = "exec"
      kill_timeout = "12h"
      env {
        a = "6"
      }
      config {
        command = "/bin/bash"
        args    = ["local/script.sh"]
      }
      template {
        data        = <<EOF
# trap 'echo "Be patient"' INT
while true
do
  echo 'hi'
  sleep 1
done
EOF
        destination = "local/script.sh"
      }
    }
  }
}
