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
  name = "${var.nodes[count.index]}"
  address = format("%0.2x", count.index)
  image = var.image
  network = var.network
  host_ed25519_priv_key = file(var.host_ed25519_priv_key)
  host_ed25519_pub_key = file(var.host_ed25519_pub_key)
  ram_size = var.ram_size
  providers = {
    libvirt = libvirt
  }
}
