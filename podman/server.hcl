# Increase log verbosity

plugin_dir = "/opt/nomad/plugins"
client {
  enabled               = true
  bridge_network_name   = "podman"
  bridge_network_subnet = "10.88.0.0/16"
}

plugin "nomad-driver-podman" {
  config {
    volumes {
      enabled = true
    }
  }
}

