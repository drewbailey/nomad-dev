backend "consul" {
  path          = "vault/"
  address       = "localhost:8500"
  cluster_addr  = "https://localhost:8201"
  redirect_addr = "http://localhost:8200"
}

listener "tcp" {
  address         = "localhost:8200"
  cluster_address = "localhost:8201"
  tls_disable     = 1
}

service_registration "consul" {
  address = "127.0.0.1:8500"
}
