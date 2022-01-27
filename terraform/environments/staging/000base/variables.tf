variable "env_name" {
  description = ""
  type        = string
  default     = "stage"
}

variable "env_layer" {
  description = ""
  type        = string
  default     = "000base"
}

variable "addresses" {
  description = ""
  type        = list(string)
  default     = ["192.168.67.0/24"]
}

variable "global_fqdn" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "global_libvirt_pool_path" {
  description = ""
  type        = string
  default     = "/var/lib/libvirt/pools"
}

