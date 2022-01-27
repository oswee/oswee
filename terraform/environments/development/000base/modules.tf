module "libvirt_pool" {
  source = "../../../modules/libvirt-pool"
  name = "${var.env_name}.${var.global_fqdn}"
  path = "${var.global_libvirt_pool_path}/${var.env_name}.${var.global_fqdn}"
}

module "management_network" {
  source    = "../../../modules/libvirt-network"
  mode      = var.network_mode
  bridge    = var.network_bridge
  addresses = null
  network = {
    name = var.network_name
  }
  domain = null
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

# module "libvirt_network" {
#   source    = "../../../modules/libvirt-network"
#   addresses = var.addresses
#   network = {
#     name = "${var.env_name}.${var.global_fqdn}"
#   }
#   domain = "${var.env_name}.${var.global_fqdn}"
# }
