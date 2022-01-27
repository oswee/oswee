output "name" {
  description = "Name of the Libvirt Network"
  value       = libvirt_network.network.name
}

output "id" {
  description = "ID of the Libvirt Network"
  value       = libvirt_network.network.id
}

