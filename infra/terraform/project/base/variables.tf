variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "cloudflare_api_token" {
  description = "CloudFlare API Token"
  type        = string
  default     = ""
}

variable "cloudflare_account_id" {
  description = "CloudFlare Account ID"
  type        = string
  default     = ""
}

variable "root_domain" {
  description = "Root Domain"
  type        = string
  default     = "example.com"
}

variable "public_ip_address" {
  description = "Primary Public IP address"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "Fully Qualified Domain Name"
  type        = string
  default     = "management"
}

variable "gateway_ip" {
  description = "Internet gateway IP address"
  type        = string
  default     = "192.168.0.0"
}


variable "vault_address" {
  description = "Hashicorp Vault instance URL address"
  type        = string
  default     = "https://vault.example.local"
}

# variable "bastion" {
#   description = "Bastion Guest"
#   type = object({
#     hostname   = string
#     ip_address = string
#     user       = string
#   })
# }
#
# variable "vault" {
#   description = "Vault Guest"
#   type = object({
#     hostname   = string
#     ip_address = string
#     user       = string
#   })
# }
