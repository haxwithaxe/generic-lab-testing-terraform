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


#module "workers" {
#  source = "./modules/node"
#  name = "hello"
#  type = "worker"
#  host_ed25519_priv_key = var.host_ed25519_priv_key
#  host_ed25519_pub_key = var.host_ed25519_pub_key
#  host_rsa_priv_key = var.host_rsa_priv_key
#  host_rsa_pub_key = var.host_rsa_pub_key
#  providers = {
#    libvirt = libvirt
#  }
#}

module "workers" {
  source = "./modules/node"
  for_each = var.workers
  name = each.key
  type = "worker"
  host_ed25519_priv_key = var.host_ed25519_priv_key
  host_ed25519_pub_key = var.host_ed25519_pub_key
  host_rsa_priv_key = var.host_rsa_priv_key
  host_rsa_pub_key = var.host_rsa_pub_key
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
  host_ed25519_priv_key = var.host_ed25519_priv_key
  host_ed25519_pub_key = var.host_ed25519_pub_key
  host_rsa_priv_key = var.host_rsa_priv_key
  host_rsa_pub_key = var.host_rsa_pub_key
  providers = {
    libvirt = libvirt
  }
}
