# module "management_network" {
#   source    = "../../../modules/libvirt-network"
#   mode      = var.network_mode
#   bridge    = var.network_bridge
#   addresses = var.addresses
#   network = {
#     name = var.network_name
#   }
#   domain = null
# }

module "management_network" {
  source    = "../../../modules/libvirt-network"
  mode      = "bridge"
  bridge    = "virbr0"
  # addresses = ["192.168.100.0/16"]
  network = {
    name = "management"
  }
  domain = null
}

output "management_network" {
  description = "Libvirt network"
  value       = module.management_network
}

# module "development_network" {
#   source    = "../../../modules/libvirt-network"
#   mode      = "bridge"
#   bridge    = "virbr0"
#   addresses = null
#   network = {
#     name = "development"
#   }
#   domain = null
# }

# output "development_network" {
#   description = "Libvirt network"
#   value       = module.development_network
# }

# module "libvirt_network" {
#   source    = "../../../modules/libvirt-network"
#   addresses = var.addresses
#   network = {
#     name = "${var.env_name}.${var.global_dev_fqdn}"
#   }
#   domain = "${var.env_name}.${var.global_dev_fqdn}"
# }

# output "libvirt_network" {
#   description = "Libvirt network"
#   value       = module.libvirt_network
# }
