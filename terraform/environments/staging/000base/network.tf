module "libvirt_network" {
  source    = "../../modules/libvirt-network"
  addresses = var.addresses
  network = {
    name = "${terraform.workspace}-${var.env_name}"
  }
  domain = "${var.env_name}.${var.global_fqdn}"
}

