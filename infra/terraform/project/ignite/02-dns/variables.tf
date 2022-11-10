variable "root_access_grant" {
  description = "Storj.io API Token"
  type        = string
  default     = ""
}

variable "storj_satellite_address" {
  description = "Storj.io Satellite Address"
  type        = string
  default     = ""
}

variable "cloudflare_api_token" {
  description = "CloudFlare API Token"
  type        = string
  default     = ""
}

variable "cloudflare_account_id" {
  description = ""
  type        = string
}

variable "root_domain" {
  description = ""
  type        = string
}

# variable "cloudflare_root_zone_id" {
#   description = ""
#   type        = string
# }

variable "hostname" {
  description = "Hostname of the instance"
  type        = string
  default     = "fedora"
}

variable "public_ip_address" {
  description = ""
  type        = string
}

variable "endpoint" {
  description = ""
  type        = string
}

variable "access_key" {
  description = ""
  type        = string
}

variable "secret_key" {
  description = ""
  type        = string
}
