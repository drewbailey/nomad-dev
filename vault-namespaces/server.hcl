

plugin_dir = "/opt/nomad/plugins"

data_dir = "/tmp/nomad-vault-server"

server {
  enabled          = true
  bootstrap_expect = 1
}

vault {
  enabled               = true
  address               = "http://127.0.0.1:8200"
  task_token_ttl        = "1h"
  create_from_role      = "nomad-cluster"
  token                 = "s.N5Rv5OJpUbxviQkkqVtmlFni.fvuLy"
  allow_unauthenticated = false
  namespace             = "engineering"
}
