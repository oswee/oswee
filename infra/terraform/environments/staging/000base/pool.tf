module "libvirt_pool" {
  source = "../../modules/libvirt-pool"
  pool = {
    name = "${terraform.workspace}-${var.env_name}"
    path = var.global_libvirt_pool_path
  }
}

