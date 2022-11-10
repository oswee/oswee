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

# These are loaded from auto.tfvars
# _________________________________

variable "cloudflare_api_token" {
  description = "CloudFlare API Token"
  type        = string
  default     = ""
  sensitive   = true
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

variable "public_root_domain" {
  description = ""
  type        = string
  default     = "example.com"
  sensitive   = true
}

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

variable "instance" {
  description = ""
  type = object({
    name       = string
    hostname   = string
    ip_address = string
    user       = string
  })
  default = {
    name       = "instance"
    hostname   = "instance"
    ip_address = "192.168.0.0"
    user       = "admin"
  }
}

variable "vault" {
  description = ""
  type = object({
    address = string
  })
  default = {
    address = "https://vault.example.local"
  }
}
