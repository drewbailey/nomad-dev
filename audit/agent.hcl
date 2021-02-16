log_level = "TRACE"

# Setup data dir
data_dir = "/tmp/server1"

# Give the agent a unique name. Defaults to hostname
name = "server1"

# Enable the server
server {
  enabled = true

  server_join {
    # retry_join = ["127.0.0.1:5648", "127.0.0.1:6648"]
  }

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 1

  raft_protocol = 2
}

# audit {
#   enabled = true
# }

audit {
  enabled = true


  # sink "file" {
  #   type               = "file"
  #   format             = "json"
  #   delivery_guarantee = "enforced"
  #   path               = "/tmp/audit5.log"
  # }


  # filter "default" {
  #   type       = "HTTPEvent"
  #   endpoints  = ["/ui/", "/v1/agent/health"]
  #   stages     = ["*"]
  #   operations = ["*"]
  # }
}

