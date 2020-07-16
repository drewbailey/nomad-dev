# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server-east-1"

# Give the agent a unique name. Defaults to hostname
name = "server1"

# Enable the server
server {
  enabled = true

  server_join {
    retry_join = ["127.0.0.1:5648", "127.0.0.1:6648"]
  }

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 1
}

ports {
  http = 7646
  rpc  = 7647
  serf = 7648
}

# client {
#   enabled = true


#   node_class = "class-3"


#   meta {
#     tag = "bar"
#   }
# }


# acl {
#   enabled    = true
#   token_ttl  = "30s"
#   policy_ttl = "60s"
# }

