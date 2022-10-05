resource "libvirt_volume" "volume" {
  name   = "${local.volume.name}.${local.volume.format}"
  source = local.volume.source
  format = local.volume.format
  pool   = local.volume.pool
}

# tag::tagname[]

resource "libvirt_cloudinit_disk" "cloudinit" {
  name           = "${local.cloudinit.name}-cloudinit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = local.volume.pool
}

# end::tagname[]

resource "libvirt_domain" "domain" {
  name   = local.domain.name
  memory = local.domain.memory
  vcpu   = local.domain.vcpu
  arch   = local.domain.arch

  cpu = {
    mode = "host-passthrough"
  }

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  network_interface {
    network_id     = local.network.id
    network_name   = var.network.name
    mac            = local.network.mac
    wait_for_lease = local.network.wait_for_lease
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
