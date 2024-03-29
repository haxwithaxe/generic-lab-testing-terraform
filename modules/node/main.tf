terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

# Defining VM Volume
resource "libvirt_volume" "os_img" {
  name = "${var.project}-base-${var.name}.qcow2"
  pool = var.storage_pool
  source = var.image
  format = "qcow2"
}

# Get user data info
data "template_file" "user_data" {
  template = "${file("${path.module}/cloud-init-user-data.yml")}"
  vars = {
    hostname = "${var.name}"
    host_ed25519_priv_key = var.host_ed25519_priv_key
    host_ed25519_pub_key = var.host_ed25519_pub_key
  }
}

# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "cloud-init" {
  name = "cloud-init-${var.project}-${var.name}.iso"
  pool = var.storage_pool
  user_data = "${data.template_file.user_data.rendered}"
}

# Define KVM domain to create
resource "libvirt_domain" "node" {
  name = "${var.project}-${var.name}"
  memory = var.ram_size
  vcpu = var.vcpu_count

  network_interface {
    bridge = var.bridge
    mac = var.mac
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
