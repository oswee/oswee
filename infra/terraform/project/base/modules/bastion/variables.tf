variable "fqdn" {
  description = "Fully Qualified Domain Name"
  type        = string
  default     = "bastion.oswee.dev"
}

variable "hostname" {
  description = "Hostname of the instance"
  type        = string
  default     = "bastion"
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "ansible_fedora_dev_ed25519"
}

variable "volume" {
  description = ""
  type = object({
    name = optional(string)
    pool = optional(string)
  })
}

variable "cloudinit" {
  description = ""
  type = object({
    name = optional(string)
  })
}

variable "addresses" {
  description = ""
  type        = list(string)
}

variable "gateway" {
  description = ""
  type        = string
}

variable "vm" {
  description = ""
  type = object({
    user             = optional(string)
    user_ssh_pub_key = optional(string)
    hostname         = optional(string)
    domain           = optional(string)
  })
}

variable "domain" {
  description = ""
  type = object({
    name = optional(string)
  })
}

variable "vault" {
  description = ""
  type = object({
    address = optional(string)
  })
}

variable "network" {
  description = ""
  type = object({
    name = string
    mac  = optional(string)
  })
}

variable "cloudflare_api_token" {
  description = "CloudFlare API Token"
  type        = string
  default     = ""
}

variable "cloudflare_root_zone_id" {
  description = ""
  type        = string
}

variable "public_ip_address" {
  description = ""
  type        = string
}
