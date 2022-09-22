resource "libvirt_network" "network" {
  name      = local.network.name
  mode      = var.mode
  bridge    = var.bridge
  domain    = var.domain
  addresses = var.addresses
  autostart = var.autostart
  dhcp {
    enabled = var.dhcp.enabled
  }
  dns {
    enabled = var.dhcp.enabled
  }
  xml {
    # xslt = file("xslt/network.xsl")
    xslt = templatefile("${path.module}/templates/network.xsl", {})
  }
}
