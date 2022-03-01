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
  count = length(var.nodes)
  name = "${count.index}${var.nodes[count.index]}"
  address = format("%0.2x", count.index)
  host_ed25519_priv_key = var.host_ed25519_priv_key
  host_ed25519_pub_key = var.host_ed25519_pub_key
  providers = {
    libvirt = libvirt
  }
}
