variable "fqdn" {
  description = "Fully Qualified Domain Name"
  type        = string
  default     = "www.example.local"
}

variable "hostname" {
  description = "Hostname of the instance"
  type        = string
  default     = "fedora"
}

variable "volume" {
  description = "Libvirt domain volume"
  type = object({
    name = optional(string)
    pool = optional(string, "/var/lib/libvirt/pools")
    # Use local pre-dowloaded image for faster provisioning
    source = optional(string, "/mnt/data/cloudinit/Fedora-Cloud-Base-36-1.5.x86_64.qcow2")
    # source = optional(string, "https://download.fedoraproject.org/pub/fedora/linux/releases/36/Cloud/x86_64/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2")
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
    hostname = optional(string)
    user     = optional(string, "terraform")
    # user_ssh_pub_key = optional(string, "")
    user_ssh_pub_key = string
    domain           = optional(string, "example.local")
    time_zone        = optional(string, "UTC")
  })
}

variable "vault" {
  type = object({
    address   = optional(string, "https://vault.example.local")
    role_id   = optional(string, "")
    secret_id = optional(string, "")
  })
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
  description = ""
  type        = list(string)
  default     = []
}

variable "ssh_host_cert" {
  description = "Enable SSH Host key signing"
  type        = bool
  default     = false
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
