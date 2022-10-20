module "network" {
  source = "../../../../modules/libvirt-network/"
  mode   = var.network_mode
  bridge = var.network_bridge
  network = {
    name = var.network_name
  }
  domain = null
}

output "name" {
  description = "Libvirt network"
  value       = module.network.name
}
