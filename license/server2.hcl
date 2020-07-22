log_level = "TRACE"

data_dir = "/tmp/server-license-2"

datacenter = "dc1"
server {
  enabled          = true
  bootstrap_expect = 3
}

ports {
  http = 5646
  rpc  = 5647
  serf = 5648
}
