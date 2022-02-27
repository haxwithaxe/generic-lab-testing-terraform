variable "name" {
  type = string
}

variable "type" {
  type = string
}

variable "address" {
  type = string
  default = null
}

variable "gw" {
  type = string
  default = null
}

variable "storage_pool" {
  type = string
  default = "default"	
}

variable "network0" {
  type = string
  default = "default"
}

variable "network1" {
  type = string
  default = "hostonly"
}

variable "host_ed25519_priv_key" {
  type = string
  default = null
  sensitive = true
}

variable "host_ed25519_pub_key" {
  type = string
  default = null
  sensitive = true
}

variable "host_rsa_priv_key" {
  type = string
  default = null
  sensitive = true
}

variable "host_rsa_pub_key" {
  type = string
  default = null
  sensitive = true
}
