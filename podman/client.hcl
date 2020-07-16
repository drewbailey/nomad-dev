# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/client6"

# Give the agent a unique name. Defaults to hostname
name = "clientpodman"

plugin_dir = "/opt/nomad/plugins"

client {
  enabled = true
}

plugin "nomad-driver-podman" {
  config {
    volumes {
      enabled      = true
      selinuxlabel = "z"
    }
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

# different port than server
ports {
  http = 7646
}
