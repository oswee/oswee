module "libvirt_pool" {
  source = "../../../modules/libvirt-pool"
  pool = {
    name = "${var.env_name}.${var.global_fqdn}"
    path = "${var.global_libvirt_pool_path}/${var.global_fqdn}/${var.env_name}"
  }
}

module "libvirt_network" {
  source    = "../../../modules/libvirt-network"
  addresses = var.addresses
  network = {
    name = "${var.env_name}.${var.global_fqdn}"
  }
  domain = "${var.env_name}.${var.global_fqdn}"
}

