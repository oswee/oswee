variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "bastion"
}

variable "env_layer" {
  description = "Environment layer"
  type        = string
  default     = "040bastion"
}

variable "global_fqdn" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "instance_name" {
  description = ""
  type        = string
  default     = "bastion"
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "ansible_bastion_dev_ecdsa"
}

