# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/client3"

# Give the agent a unique name. Defaults to hostname
name = "client3"

# Enable the client
client {
  node_class = "class-1"
  enabled    = true

  server_join {
    retry_join = ["127.0.0.1:4647", "127.0.0.1:5647", "127.0.0.1:6647"]
  }

  meta {
    tag = "bar"
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ports {
  http = 9646
}

acl {
  enabled = true
}

# acl {
#   enabled    = true
#   token_ttl  = "30s"
#   policy_ttl = "60s"
# }

