# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/client1"

# Give the agent a unique name. Defaults to hostname
name = "client1"

# Enable debugging
enable_debug = true

# Enable the client
client {
  enabled = true

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
