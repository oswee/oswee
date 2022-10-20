variable "cloudflare_api_token" {
  description = "CloudFlare API Token"
  type        = string
  default     = ""
}

variable "gitlab_root_domain" {
  type        = string
  description = "The domain Gitlab server will be exposed on"
  default = "example.com"
}
