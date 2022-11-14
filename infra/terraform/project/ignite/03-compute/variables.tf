# These are loaded from environment variables
# ___________________________________________

variable "s3_bucket" {
  description = ""
  type        = string
  sensitive   = true
}

variable "access_key" {
  description = ""
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = ""
  type        = string
  sensitive   = true
}

variable "endpoint" {
  description = ""
  type        = string
}

# ___________________________________________

variable "local_root_domain" {
  description = ""
  type        = string
  default     = "example.local"
  sensitive   = true
}

variable "gateway_ip" {
  description = ""
  type        = string
  default     = "192.168.0.0"
  sensitive   = true
}

variable "vault_url" {
  description = ""
  type        = string
  default     = "https://vault.example.local"
}

variable "vault" {
  description = ""
  type = object({
    hostname   = string
    ip_address = string
    user       = string
  })
  default = {
    hostname   = "instance"
    ip_address = "192.168.0.0"
    user       = "admin"
  }
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "terraform_id_ed25519"
}

variable "public_ip_address" {
  description = ""
  type        = string
}

variable "cloudflare_api_token" {
  description = "CloudFlare API Token"
  type        = string
  default     = ""
  sensitive   = true
}
