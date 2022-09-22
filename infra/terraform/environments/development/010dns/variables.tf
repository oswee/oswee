variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "global_fqdn" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "instance_name" {
  description = ""
  type        = string
  default     = "ns1"
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "ansible_ns1_dev_ecdsa"
}

variable "interface_name" {
  description = "Primary network interface name"
  type        = string
  default     = "eth0"
}

variable "provider_libvirt_uri" {
  description = "Qemu server uri. Format - qemu+ssh://user@host:2222/system"
  type        = string
  default     = "qemu:///system"
}

variable "network_addresses" {
  description = ""
  type        = list(string)
  default     = ["192.168.0.253/16"]
}

variable "network_mac" {
  description = ""
  type        = string
  default     = "56:90:01:22:e9:05"
}

variable "default_gateway" {
  description = ""
  type        = string
  default     = "192.168.254.254"
}
