namespace "default" {
  policy = "write"
}

# operator {
#   policy = "read"
# }

# agent {
#   policy = "write"
# }

job {
  policy = "read"
}

node {
  policy = "deny"
}

quota {
  policy = "write"
}
