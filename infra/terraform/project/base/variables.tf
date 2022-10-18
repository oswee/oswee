variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "fqdn" {
  description = "Fully Qualified Domain Name"
  type        = string
  default     = "example.com"
}

variable "network_name" {
  description = "Fully Qualified Domain Name"
  type        = string
  default     = "management"
}
