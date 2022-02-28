variable "name" {
  type = string
}

variable "address" {
  type = string
  default = null
  description = "Final octet of both mac addresses."
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
  default = "development"
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

#variable "host_rsa_priv_key" {
#  type = string
#  default = null
#  sensitive = true
#}

#variable "host_rsa_pub_key" {
#  type = string
#  default = null
#  sensitive = true
#}
