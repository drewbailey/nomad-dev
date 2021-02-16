# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server4"

# Give the agent a unique name. Defaults to hostname
name = "server4"

# Enable the server
server {
  enabled = true

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 1

  raft_protocol = 3

  # enable_event_broker = true
  # event_buffer_size   = 1000
}


# acl {
#   enabled = true
# }


