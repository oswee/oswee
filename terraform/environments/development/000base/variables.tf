variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "env_layer" {
  description = "Environment layer name"
  type        = string
  default     = "000base"
}

variable "provider_libvirt_uri" {
  description = "Qemu server uri. Format - qemu+ssh://user@host:2222/system"
  type        = string
  default     = "qemu:///system"
}

variable "addresses" {
  description = ""
  type        = list(string)
  default     = ["192.168.0.0/24"]
}

variable "global_fqdn" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "global_libvirt_pool_path" {
  description = ""
  type        = string
  default     = "/var/lib/libvirt/images"
}

variable "network_mode" {
  description = ""
  type        = string
  default     = "bridge"
}

variable "network_bridge" {
  description = ""
  type        = string
  default     = "virbr0"
}

variable "network_name" {
  description = ""
  type        = string
  default     = "default"
}

