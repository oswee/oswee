# resource "random_pet" "instance" {}
#
# variable "fqdn" {
#   description = "Fully Qualified Domain Name"
#   type        = string
#   default     = "example.com"
# }
#
# variable "global_libvirt_pool_path" {
#   description = ""
#   type        = string
#   default     = "/var/lib/libvirt/images"
# }
#
# variable "environment" {
#   description = "Environment name"
#   type        = string
#   default     = "dev"
# }
#
# variable "provider_libvirt_uri" {
#   description = "Qemu server uri. Format - qemu+ssh://user@host:2222/system"
#   type        = string
#   default     = "qemu:///system"
# }
#
# variable "addresses" {
#   description = ""
#   type        = list(string)
#   default     = ["192.168.0.0/24"]
# }
#
# variable "libvirt_pool_type" {
#   description = ""
#   type        = string
#   default     = "dir"
# }

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
