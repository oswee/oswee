module "network" {
  source = "../../../modules/libvirt-network"
  mode   = "bridge"
  bridge = "virbr0"
  network = {
    name = "management"
  }
  domain = null
}

output "name" {
  description = "Libvirt network"
  value       = module.network.name
}
