# TODO: Type `logical` is not supported by this Libvirt plugin.
# Using Ansible for that
module "libvirt_pool" {
  source = "../../../modules/libvirt-pool"
  name = "${var.env_name}.${var.root_fqdn}"
  path = "${var.global_libvirt_pool_path}/${var.env_name}.${var.root_fqdn}"
}

output "libvirt_pool" {
  description = "Name of the Libvirt Pool"
  value       = module.libvirt_pool
}

