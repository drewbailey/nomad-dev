# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/client1"

# Give the agent a unique name. Defaults to hostname
name = "client1"

# Enable the client
client {
  enabled = true

  node_class = "class-1"

  server_join {
    retry_join = ["127.0.0.1:4647", "127.0.0.1:5647", "127.0.0.1:6647"]
  }

  meta {
    tag = "foo"
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ports {
  http = 7646
}

audit {
  enabled = true
}

# acl {
#   enabled    = true
#   token_ttl  = "30s"
#   policy_ttl = "60s"
# }

