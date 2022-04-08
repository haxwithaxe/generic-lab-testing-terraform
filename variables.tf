
variable "image" {
  type = string
  default = "file:///mnt/resources/vms/ubuntu-20.04-server-cloudimg-amd64-docker-base.qcow2"
}

variable "nodes" {
  type = list(string)
  default = ["alice", "bob", "charlie"]
}

variable "ram_size" {
  type = string
  default = "2048"
}

variable "network" {
  type = string
  default = "development"
}

variable "host_ed25519_priv_key" {
  type = string
  default = "ed25519_key"
  sensitive = true
}

variable "host_ed25519_pub_key" {
  type = string
  default = "ed25519_key.pub"
  sensitive = true
}
