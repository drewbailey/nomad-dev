log_level = "TRACE"

data_dir   = "/tmp/server-license-2"
name       = "server2"
datacenter = "dc1"
server {
  enabled          = true
  bootstrap_expect = 2
  server_join {
    retry_join = ["127.0.0.1:4648"]
  }
}

ports {
  http = 5646
  rpc  = 5647
  serf = 5648
}
