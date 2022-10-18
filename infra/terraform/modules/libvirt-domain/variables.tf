variable "volume" {
  description = "Libvirt domain volume"
  type = object({
    name   = optional(string)
    pool   = optional(string, "/var/lib/libvirt/pools")
    source = optional(string, "https://download.fedoraproject.org/pub/fedora/linux/releases/33/Cloud/x86_64/images/Fedora-Cloud-Base-33-1.2.x86_64.qcow2")
    format = optional(string, "qcow2")
  })
}

variable "cloudinit" {
  description = "Cloudinit image"
  type = object({
    name           = optional(string)
    dhcp           = optional(bool, true)
    interface_name = optional(string, "eth0")
  })
}

variable "vm" {
  type = object({
    hostname         = optional(string)
    user             = optional(string, "terraform")
    user_ssh_pub_key = optional(string, "")
    domain           = optional(string, "example.local")
    time_zone        = optional(string, "UTC")
  })
}

variable "vault" {
  type = object({
    address   = string
    role_id   = string
    secret_id = string
  })
  default = {
    address   = "https://vault.example.local"
    role_id   = "value"
    secret_id = "value"
  }
}

variable "domain" {
  type = object({
    name   = optional(string)
    memory = optional(string, "1024")
    vcpu   = optional(string, "1")
    arch   = optional(string, "x86_64")
  })
}

variable "network" {
  type = object({
    id             = optional(string)
    mac            = optional(string)
    name           = optional(string, "default")
    wait_for_lease = optional(bool, false)
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
  type        = string
  default     = "qemu:///system"
}
