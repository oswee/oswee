resource "libvirt_volume" "volume" {
  name   = "${var.volume.name}.${var.volume.format}"
  source = var.volume.source
  format = var.volume.format
  pool   = var.volume.pool
}

# tag::tagname[]

resource "libvirt_cloudinit_disk" "cloudinit" {
  name           = "${local.cloudinit.name}-cloudinit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = var.volume.pool
}

# end::tagname[]

resource "libvirt_domain" "domain" {
  name   = local.domain.name
  memory = var.domain.memory
  vcpu   = var.domain.vcpu
  arch   = var.domain.arch

  # cpu = {
  #   mode = "host-passthrough"
  # }

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  network_interface {
    network_id     = local.network.id
    mac            = local.network.mac
    network_name   = var.network.name
    wait_for_lease = var.network.wait_for_lease
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  disk {
    volume_id = libvirt_volume.volume.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
