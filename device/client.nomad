# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/client2"

# Give the agent a unique name. Defaults to hostname
name = "client2"

plugin_dir = "/opt/nomad/plugins"

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

plugin "example-device-hello-world" {
  config {
    fingerprint_period = "20m"
    greeting           = "¡Buenos dias!"
    greetings_per_node = 5
  }
}

ports {
  http = 7646
}
