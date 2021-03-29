# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server3"

# Give the agent a unique name. Defaults to hostname
name = "server3"

# Enable the server
server {
  enabled = true

  server_join {
    retry_join = ["127.0.0.1:4648", "127.0.0.1:5648"]
  }

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 3
  raft_protocol    = 3
  # enable_event_broker = true
  license_path = "/home/drew/work/nomad-dev/license/expired.hclic"

  # enable_event_broker = true
  # event_buffer_size   = 1000
}

audit {
  enabled = true
}

ports {
  http = 6646
  rpc  = 6647
  serf = 6648
}


# acl {
#   enabled = true
# }
