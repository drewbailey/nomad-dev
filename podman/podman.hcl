# Increase log verbosity

plugin_dir = "/opt/nomad/plugins"
# bind_addr  = "192.168.1.54"
# bind_addr = "192.168.1.244"
client {
  enabled = true

  options {
    "docker.volumes.enabled" = true
  }
}

plugin "nomad-driver-podman" {
  config {
    volumes {
      enabled = true
    }
  }
}

