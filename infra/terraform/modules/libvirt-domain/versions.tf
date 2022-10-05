terraform {
  required_version = ">= 1.3.1"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.6.4"
    }
    macaddress = {
      source  = "ivoronin/macaddress"
      version = "~>0.2.2"
    }
  }
}
