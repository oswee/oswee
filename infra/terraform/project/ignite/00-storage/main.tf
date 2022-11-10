# TODO: Type `logical` is not supported by this Libvirt plugin.
# Ansible could handle that.
module "pool" {
  source = "../../../modules/libvirt-pool"
  name   = "oswee"
  path   = "/mnt/data/libvirt/oswee"
}

output "pool" {
  description = "Name of the Libvirt Pool"
  value       = module.pool
}
