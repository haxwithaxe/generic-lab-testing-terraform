terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

# Defining VM Volume
resource "libvirt_volume" "os_img" {
  name = "docker-swarm-${var.name}.img"
  pool = "tmp" # List storage pools using virsh pool-list
  source = "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
  format = "raw"
}

# get user data info
data "template_file" "user_data" {
  template = "${file("${path.module}/cloud_init-${var.type}.yml")}"
  vars = {
    hostname = "ds_${var.name}"
    address = var.address
    gw = var.gw
  }
}

# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "cloud-init" {
  name = "cloud-init-${var.name}.iso"
  pool = "tmp" # List storage pools using virsh pool-list
  user_data = "${data.template_file.user_data.rendered}"
}

# Define KVM domain to create
resource "libvirt_domain" "swarm-node" {
  name = "ds_${var.name}"
  memory = "2048"
  vcpu = 2

  network_interface {
    network_name = "default" # List networks with virsh net-list
    wait_for_lease = "true"
  }

  disk {
    volume_id = "${libvirt_volume.os_img.id}"
  }

  cloudinit = "${libvirt_cloudinit_disk.cloud-init.id}"

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}
