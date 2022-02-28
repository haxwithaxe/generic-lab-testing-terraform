terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}


module "nodes" {
  source = "./modules/node"
  for_each = var.nodes
  name = each.key
  address = each.value
  host_ed25519_priv_key = var.host_ed25519_priv_key
  host_ed25519_pub_key = var.host_ed25519_pub_key
  providers = {
    libvirt = libvirt
  }
}
