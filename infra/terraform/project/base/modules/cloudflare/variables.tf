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

variable "public_ip_address" {
  type        = string
  description = "Primary Public IP address"
  default     = ""
}

variable "root_domain" {
  type        = string
  description = "Root domain for the DNS zone"
  default     = "example.com"
}
