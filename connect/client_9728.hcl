datacenter = "dc1"
data_dir   = "/tmp/client1"

bind_addr = "{{ GetPrivateInterfaces | include \"name\" \"wlp2s0\" | attr \"address\" }}"


client {
  # network_interface = "wlp2s0"

  host_network "public" {
    interface = "wlp2s0"
  }

  enabled = true
}


