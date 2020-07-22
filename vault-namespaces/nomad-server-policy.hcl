# Allow creating tokens under "nomad-cluster" token role. The token role name
# should be updated if "nomad-cluster" is not used.
# +/ includes all namespaces
path "auth/token/create/nomad-cluster" {
  capabilities = ["update", "sudo"]
}

path "+/+/auth/token/create/nomad-cluster" {
  capabilities = ["update", "sudo"]
}

path "+/auth/token/create/nomad-cluster" {
  capabilities = ["update", "sudo"]
}
# path "+/+/auth/token/create/nomad-cluster" {
#   capabilities = ["update", "sudo"]
# }

# Allow looking up "nomad-cluster" token role. The token role name should be
# updated if "nomad-cluster" is not used.
path "auth/token/roles/nomad-cluster" {
  capabilities = ["read"]
}

path "+/+/auth/token/roles/nomad-cluster" {
  capabilities = ["read"]
}
# Allow looking up the token passed to Nomad to validate # the token has the
# proper capabilities. This is provided by the "default" policy.
path "auth/token/lookup-self" {
  capabilities = ["read"]
}

# Allow looking up incoming tokens to validate they have permissions to access
# the tokens they are requesting. This is only required if
# `allow_unauthenticated` is set to false.
path "auth/token/lookup" {
  capabilities = ["update", "read", "create", "sudo"]
}
path "+/+/auth/token/lookup" {
  capabilities = ["update", "read", "create", "sudo"]
}
path "+/auth/token/lookup" {
  capabilities = ["update", "read", "create", "sudo"]
}

# Allow revoking tokens that should no longer exist. This allows revoking
# tokens for dead tasks.
path "auth/token/revoke-accessor" {
  capabilities = ["update"]
}

# Allow checking the capabilities of our own token. This is used to validate the
# token upon startup.
path "sys/capabilities-self" {
  capabilities = ["update"]
}

# Allow our own token to be renewed.
path "auth/token/renew-self" {
  capabilities = ["update"]
}

# Manage namespaces
path "sys/namespaces/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage policies
path "sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List policies
path "sys/policies/acl" {
  capabilities = ["list"]
}

