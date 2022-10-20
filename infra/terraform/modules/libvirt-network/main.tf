terraform {
  required_version = ">= 1.3.1"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.7.0"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
  /* uri = "qemu+ssh://dzintars@192.168.1.2/system" */
}

resource "libvirt_network" "network" {
  name      = var.network.name
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
    xslt = templatefile("${path.module}/templates/network.xsl", {})
  }
}

output "name" {
  description = "Name of the Libvirt Network"
  value       = libvirt_network.network.name
}

output "id" {
  description = "ID of the Libvirt Network"
  value       = libvirt_network.network.id
}
