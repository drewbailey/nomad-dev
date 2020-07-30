log_level = "TRACE"

data_dir   = "/tmp/server-license"
name       = "server1"
datacenter = "dc1"
server {
  enabled          = true
  bootstrap_expect = 2
  server_join {
    retry_join = ["127.0.0.1:5648"]
  }
}

