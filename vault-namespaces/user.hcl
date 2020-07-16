# Manage secrets at 'team-secret'
path "team-secret/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
