vault server -dev

export VAULT_ADDR='http://127.0.0.1:8200'

vault operator unseal

vault login
vault policy write nomad-server nomad-server-policy.hcl
vault write /auth/token/roles/nomad-cluster @nomad-cluser-role.json
vault token create -policy nomad-server -period 72h -orphan


