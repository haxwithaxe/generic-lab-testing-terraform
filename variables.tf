variable "nodes" {
  type = map(string)
  default = {"foo" = "00", "bar" = "01", "baz" = "02"}
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
