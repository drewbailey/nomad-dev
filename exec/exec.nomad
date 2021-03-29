job "exec" {
  datacenters = ["dc1"]
  group "group" {
    task "task" {
      driver = "exec"
      config {
        command = "/bin/bash"
        args    = ["local/script.sh"]
      }
      template {
        data        = <<EOF
while true
do
  echo 'generating some load'
  base64 /dev/urandom | head -c 50000000 | sha1sum 
  sleep 10
done
EOF
        destination = "local/script.sh"
      }
    }
  }
}
