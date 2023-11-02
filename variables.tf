variable "host_ed25519_priv_key" {
  type = string
  default = "ed25519_key"
  description = "Path of the ED25519 private key file."
}

variable "host_ed25519_pub_key" {
  type = string
  default = "ed25519_key.pub"
  description = "Path of the ED25519 public key file."
}

variable "image" {
  type = string
  default = "file:///mnt/storage/disks/images/debian-latest/debian-latest-amd64-base.qcow2"
  description = "The URI of the base image."
}

variable "bridge" {
  type = string
  default = "br0"
  description = "Name of the network bridge to attach the nodes to."
}

variable "nodes" {
  type = list(string)
  default = ["apple"]
}

variable "mac_prefix" {
  type = string
  default = "0E:00:00:DD:00"
  description = "The MAC address prefix to attach to the index of the node."
}

variable "project" {
  type = string
  default = "test"
  description = "Project name. Used to prefix file names."
}

variable "ram_size" {
  type = string
  default = "2048"
  description = "RAM size in MB."
}

variable "storage_pool" {
  type = string
  default = "default"
  description = "The libvirt storage pool to store the images in."
}

variable "vcpu_count" {
  type = string
  default = "2"
  description = "The number of vcpus to assign."
}
