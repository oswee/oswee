variable "pool_name" {
  description = "Libvirt storage pool name"
  type        = string
  default     = "default"
}

variable "pool_path" {
  description = "Libvirt storage pool path"
  type        = string
  default     = "/var/lib/libvirt/images"
}
