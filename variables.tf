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
  default = "file:///mnt/resources/vms/ubuntu-20.04-server-cloudimg-amd64-docker-base.qcow2"
  description = "The URI of the base image."
}

variable "network" {
  type = string
  default = "development"
  description = "Name of the network to attach to the nodes."
}

variable "nodes" {
  type = list(string)
  default = ["alice", "bob", "charlie"]
}

variable "project" {
  type = string
  default = "swarm"
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

