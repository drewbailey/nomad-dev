log_level = "DEBUG"

data_dir = "/tmp/agent1"

datacenter = "dc1"
server {
  enabled          = true
  bootstrap_expect = 1
}

# Enable the client
client {
  enabled = true

  meta {
    tag = "foo"
  }
}

