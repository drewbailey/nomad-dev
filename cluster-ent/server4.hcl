# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server4"

# Give the agent a unique name. Defaults to hostname
name = "server4"

# Enable the server
server {
  enabled = true

  server_join {
    retry_join = ["127.0.0.1:4648", "127.0.0.1:5648"]
  }

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 2
}

ports {
  http = 6646
  rpc  = 6647
  serf = 6648
}

audit {
  enabled = true
}

# acl {
#   enabled    = true
#   token_ttl  = "30s"
#   policy_ttl = "60s"
# }

