# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server1"

# Give the agent a unique name. Defaults to hostname
name = "server1"

# Enable the server
server {
  enabled = true

  server_join {
    retry_join = ["127.0.0.1:5648", "127.0.0.1:6648"]
  }

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 3

  raft_protocol = 3

  license_path = "/home/drew/work/nomad-dev/license/expired.hclic"

  # enable_event_broker = true
  # event_buffer_size   = 1000
}

audit {
  enabled = true
}

# acl {
#   enabled = true
# }

