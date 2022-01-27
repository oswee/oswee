variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "jenkins"
}

variable "env_layer" {
  description = "Environment layer"
  type        = string
  default     = "050jenkins"
}

variable "global_fqdn" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "instance_name" {
  description = ""
  type        = string
  default     = "jenkins"
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "ansible_jenkins_dev_ecdsa"
}

