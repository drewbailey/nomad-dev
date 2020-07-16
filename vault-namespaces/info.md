# Local cluster that doesn't exist anywhere, no use in looking
############################

Unseal Key 1: 3EJHFmlTlqhJTDJktY7M5IvvgruNMdKl+uuphozKwAY=

Initial Root Token: s.HXe8iy9RQ74JvWRY2SrWvhKb


→ vault login s.HXe8iy9RQ74JvWRY2SrWvhKb
Success! You are now authenticated. The token information displayed below
is already stored in the token helper. You do NOT need to run "vault login"
again. Future Vault requests will automatically use this token.

Key                  Value
---                  -----
token                s.HXe8iy9RQ74JvWRY2SrWvhKb
token_accessor       Qn7DF0CmyZaAoze4vYx9RM01
token_duration       ∞
token_renewable      false
token_policies       ["root"]
identity_policies    []
policies             ["root"]


======================= Engineering ========================

https://learn.hashicorp.com/vault/operations/namespaces

vault policy write nomad-server nomad-server-policy.hcl

vault token create -policy nomad-server -period 72h -orphan

curl -v \
--header "X-Vault-Token: token" \
--header "X-Vault-Namespace: engineering/cloud" --request POST \
--data @payload.json \

{
  "policies": ["access-kv"],
  "ttl": "1h",
  "renewable": true
}

vault token capabilities  s.AB9SxaXfZ5YWNpCtr9AqvDxZ.62WAv engineering/secret/foo
