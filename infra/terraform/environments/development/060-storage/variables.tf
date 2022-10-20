variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "env_layer" {
  description = "Environment layer name"
  type        = string
  default     = "060storage"
}

variable "global_fqdn" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "instance_name" {
  description = ""
  type        = string
  default     = "s3"
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "ansible_s3_dev_ecdsa"
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
  default     = ["192.168.0.248/16"]
}

variable "network_mac" {
  description = ""
  type        = string
  default     = "46:ea:9d:e4:1a:02"
}

variable "default_gateway" {
  description = ""
  type        = string
  default     = "192.168.0.1"
}

