variable "name" {
  description = "Libvirt storage pool name"
  type        = string
  default     = "default"
}

variable "type" {
  description = "Libvirt storage pool type"
  type        = string
  default     = "dir"
}

variable "path" {
  description = "Libvirt storage pool path"
  type        = string
  default     = "/var/lib/libvirt/images"
}

