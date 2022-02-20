variable "workers" {
  type = set(string)
  default = ["foo", "bar"]
}

variable "manager_ip" {
	type = string
  default = "10.10.10.254"
}

variable "manager_gw" {
	type = string
  default = "10.10.10.1"
}
