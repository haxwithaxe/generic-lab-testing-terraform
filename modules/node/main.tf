terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

# Defining VM Volume
resource "libvirt_volume" "os_img" {
  name = "docker-swarm-base-${var.name}.qcow2"
  pool = var.storage_pool
  source = "file:///mnt/resources/vms/ubuntu-20.04-server-base"
  format = "qcow2"
}

resource "libvirt_volume" "disk_resized" {
  name = "ds_${var.name}.qcow2"
  base_volume_id = libvirt_volume.os_img.id
  pool = "default"
  size = 53687091200
}

# get user data info
data "template_file" "user_data" {
  template = "${file("${path.module}/cloud-init-user-data.yml")}"
  vars = {
    hostname = "ds-${var.name}"
    host_ed25519_priv_key = var.host_ed25519_priv_key
    host_ed25519_pub_key = var.host_ed25519_pub_key
  }
}

data "template_file" "network_config" {
  template = "${file("${path.module}/cloud-init-net-config.yml")}"
}

# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "cloud-init" {
  name = "cloud-init-${var.name}.iso"
  pool = var.storage_pool
  user_data = "${data.template_file.user_data.rendered}"
  network_config = "${data.template_file.network_config.rendered}"
}

# Define KVM domain to create
resource "libvirt_domain" "swarm-node" {
  name = "ds_${var.name}"
  memory = "2048"
  vcpu = 2

  network_interface {
    network_name = var.network0
    mac = "0E:00:00:00:00:${var.address}"
    #wait_for_lease = "true"
  }

  network_interface {
    network_name = var.network1
    mac = "0E:00:00:00:01:${var.address}"
    #wait_for_lease = "true"
 }

  disk {
    volume_id = "${libvirt_volume.disk_resized.id}"
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
