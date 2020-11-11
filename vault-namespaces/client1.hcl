data_dir = "/tmp/nomad-vault-client-1"
name     = "client1"

client {
  enabled    = true
  node_class = "class-1"

  server_join {
    retry_join = ["127.0.0.1:4647", "127.0.0.1:5647", "127.0.0.1:6647"]
  }
}

vault {
  enabled   = true
  address   = "http://127.0.0.1:8200"
  namespace = "engineering"
}

ports {
  http = 7646
}

plugin "raw_exec" {
  config { enabled = true }
}
