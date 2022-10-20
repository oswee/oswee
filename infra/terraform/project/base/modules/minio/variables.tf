variable "fqdn" {
  description = "Fully Qualified Domain Name"
  type        = string
  default     = "www.example.com"
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "ansible_minio_dev_ed25519"
}

# variable "libvirt_pool_name" {
#   description = "Libvirt storage pool name"
#   type        = string
#   default     = "default"
# }
#
# variable "libvirt_pool_path" {
#   description = "Libvirt storage pool path"
#   type        = string
#   default     = "/var/lib/libvirt/images"
# }

variable "volume" {
  description = ""
  type = object({
    name = optional(string)
    pool = optional(string)
  })
}

variable "cloudinit" {
  description = ""
  type = object({
    name = optional(string)
  })
}

variable "addresses" {
  description = ""
  type        = list(string)
}

variable "gateway" {
  description = ""
  type        = string
}

variable "vm" {
  description = ""
  type = object({
    user             = optional(string)
    user_ssh_pub_key = optional(string)
    hostname         = optional(string)
    domain           = optional(string)
  })
}

variable "domain" {
  description = ""
  type = object({
    name = optional(string)
  })
}

variable "network" {
  description = ""
  type = object({
    name = string
    mac  = optional(string)
  })
}
