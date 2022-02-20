# Output Server IP
output "ip" {
  value = "${libvirt_domain.swarm-node.network_interface.0.addresses.0}"
}
