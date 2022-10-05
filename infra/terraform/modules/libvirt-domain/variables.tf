variable "volume" {
  description = "Libvirt domain volume"
  type = object({
    name   = optional(string)
    pool   = optional(string)
    source = optional(string)
    format = optional(string)
  })
}

variable "cloudinit" {
  description = "Cloudinit image"
  type = object({
    name           = optional(string)
    dhcp           = optional(bool)
    interface_name = optional(string)
  })
  # default = {
  #   name           = ""
  #   dhcp           = false
  #   interface_name = ""
  #   addresses      = ""
  #   gateway        = ""
  #   nameservers    = {
  #     ns1 = ""
  #     ns2 = ""
  #     ns3 = ""
  #   }
  # }
}

variable "vm" {
  type = object({
    user             = optional(string)
    user_ssh_pub_key = optional(string)
    hostname         = optional(string)
    domain           = optional(string)
    time_zone        = optional(string)
  })
}

variable "vault" {
  type = object({
    address   = string
    role_id   = string
    secret_id = string
  })
}

variable "domain" {
  type = object({
    name   = optional(string)
    memory = optional(string)
    vcpu   = optional(string)
    arch   = optional(string)
  })
}

variable "network" {
  type = object({
    id             = optional(string)
    name           = string
    mac            = optional(string)
    wait_for_lease = optional(bool)
  })
}

variable "addresses" {
  type    = list(string)
  default = []
}

variable "gateway" {
  type    = string
  default = ""
}

variable "nameservers" {
  type    = list(string)
  default = []
}

variable "provider_libvirt_uri" {
  description = "Qemu server uri. Format - qemu+ssh://user@host:2222/system"
  type    = string
  default = "qemu:///system"
}
