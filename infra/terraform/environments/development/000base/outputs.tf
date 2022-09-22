output "libvirt_pool" {
  description = "Name of the Libvirt Pool"
  value       = module.libvirt_pool
}

# output "libvirt_network" {
#   description = "Libvirt network"
#   value       = module.libvirt_network
# }

output "management_network" {
  description = "Libvirt network"
  value       = module.management_network
}

# output "development_network" {
#   description = "Libvirt network"
#   value       = module.development_network
# }
