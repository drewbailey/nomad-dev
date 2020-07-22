log_level = "TRACE"

data_dir = "/tmp/server-license-3"

datacenter = "dc1"
server {
  enabled          = true
  bootstrap_expect = 3
}

ports {
  http = 6646
  rpc  = 6647
  serf = 6648
}
