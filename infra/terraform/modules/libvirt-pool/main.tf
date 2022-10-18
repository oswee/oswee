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

resource "libvirt_pool" "pool" {
  name = var.name
  type = var.type
  path = var.path
}

output "name" {
  description = "Name of the Libvirt Pool"
  value       = libvirt_pool.pool.name
}
