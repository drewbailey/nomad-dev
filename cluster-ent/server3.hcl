# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server3"

# Give the agent a unique name. Defaults to hostname
name = "server3"

# Enable the server
server {
  enabled = true

  server_join {
    retry_join = ["127.0.0.1:4648", "127.0.0.1:5648"]
  }

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect    = 2
  upgrade_version     = "1.2.4"
  raft_protocol       = 3
  enable_event_broker = true
  durable_event_count = 2000
}

autopilot {
  cleanup_dead_servers      = true
  last_contact_threshold    = "200ms"
  max_trailing_logs         = 250
  server_stabilization_time = "10s"
  enable_redundancy_zones   = false
  disable_upgrade_migration = false
  enable_custom_upgrades    = true
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

