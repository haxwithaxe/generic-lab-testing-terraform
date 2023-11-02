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
  project = var.project
  name = "${var.nodes[count.index]}"
  mac = format("${var.mac_prefix}:%0.2x", count.index)
  image = var.image
  bridge = var.bridge
  host_ed25519_priv_key = file(var.host_ed25519_priv_key)
  host_ed25519_pub_key = file(var.host_ed25519_pub_key)
  ram_size = var.ram_size
  vcpu_count = var.vcpu_count
  providers = {
    libvirt = libvirt
  }
}
