log_level = "DEBUG"

data_dir = "/tmp/server1"

datacenter = "dc1"
server {
  enabled          = true
  bootstrap_expect = 1

}
# vault {
#   enabled          = false
#   address          = "http://127.0.0.1:8200"
#   task_token_ttl   = "1h"
#   create_from_role = "nomad-cluster"
#   token            = "s.d1P9vrSppbzTCMFNq5lgBPQv"
# }
