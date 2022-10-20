# TODO: Type `logical` is not supported by this Libvirt plugin.
# Using Ansible for that
module "pool" {
  source = "../../../../modules/libvirt-pool"
  name   = var.pool_name
  path   = var.pool_path
}

output "pool" {
  description = "Name of the Libvirt Pool"
  value       = module.pool
}
