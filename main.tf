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


module "workers" {
  source = "./modules/node"
  for_each = var.workers
  name = each.key
  type = "worker"
  providers = {
    libvirt = libvirt
  }
}


module "manager" {
  source = "./modules/node"
  name = "queen"
  type = "manager"
  address = var.manager_ip
  gw = var.manager_gw
  providers = {
    libvirt = libvirt
  }
}
