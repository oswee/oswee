resource "random_pet" "instance" {}
resource "random_uuid" "instance" {}
resource "macaddress" "mac" {}

locals {
  volume = {
    name = coalesce(var.volume.name, random_pet.instance.id)
  }

  network = {
    id  = coalesce(var.network.id, random_uuid.instance.id)
    mac = coalesce(var.network.mac, macaddress.mac.address)
  }

  cloudinit = {
    name = coalesce(var.cloudinit.name, random_pet.instance.id)
  }

  vm = {
    hostname = coalesce(var.vm.hostname, random_pet.instance.id)
  }

  domain = {
    name = coalesce(var.domain.name, random_pet.instance.id)
  }
}
