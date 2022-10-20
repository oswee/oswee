variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "root_fqdn" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "vault_url" {
  description = "Hashicorp Vault URL"
  type        = string
  default     = "https://vault.example.com"
}

variable "instance_name" {
  description = ""
  type        = string
  default     = "ca"
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "ansible_ca_dev_ed25519"
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
  default     = ["192.168.100.199/16"]
}

variable "network_mac" {
  description = ""
  type        = string
  default     = "2b:70:31:76:6a:ac"
}

variable "default_gateway" {
  description = ""
  type        = string
  default     = "192.168.254.254"
}
