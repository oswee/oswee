terraform {
  required_version = ">= 1.3.1"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.7.0"
    }

    macaddress = {
      source  = "ivoronin/macaddress"
      version = ">= 0.3.2"
    }
  }
}
