service       = "ordre"
runtime       = "vm"
subnet_prefix = "10.20.0.0/24"

ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMQ32gu8mGVI86gkUex5JsBeg7WC58bsUOVuxmeHDJW oblig2-ingen-privat-nokkel"

extra_tcp_rules = {
  "allow-tcp-8965" = {
    priority = 110
    port     = 8965
    source   = "172.16.41.0/24"
  }
}