variable "host_ed25519_priv_key" {
  type = string
  default = null
  sensitive = true
  description = "The ED25519 private key."
}

variable "host_ed25519_pub_key" {
  type = string
  default = null
  description = "The ED25519 public key."
}

variable "image" {
  type = string
  description = "The URI of the base image."
}

variable "name" {
  type = string
  description = "Node name."
}

variable "bridge" {
  type = string
  default = "br0"
  description = "Name of the network bridge to attach the node to."
}

variable "mac" {
  type = string
  default = null
  description = "MAC address."
}

variable "project" {
  type = string
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
