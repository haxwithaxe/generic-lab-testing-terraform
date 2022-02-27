variable "workers" {
  type = set(string)
  default = ["foo", "bar"]
}

variable "manager_ip" {
  type = string
  default = "192.168.100.254/24"
}

variable "manager_gw" {
  type = string
  default = "192.168.100.1"
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
