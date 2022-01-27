# variable "network" {
#   description = "Libvirt network"
#   type        = object({
#     name       = optional(string)
#     mode       = optional(string)
#     domain     = optional(string)
#     addresses  = optional(string)
#     autostart  = optional(bool)
#     dhcp       = object({
#       enabled   = optional(bool)
#     })
#     dns        = object({
#       enabled   = optional(bool)
#     })
#   })
# }

variable "network" {
  description = ""
  type = object({
    name = optional(string)
  })
}

variable "mode" {
  description = ""
  type        = string
  default     = "nat"
}

variable "bridge" {
  description = ""
  type        = string
  default     = null
}

variable "domain" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "addresses" {
  description = ""
  type        = list(string)
  default     = null
}

variable "autostart" {
  description = ""
  type        = bool
  default     = true
}

variable "dhcp" {
  description = ""
  type = object({
    enabled = bool
  })
  default = {
    enabled = false
  }
}

variable "dns" {
  description = ""
  type = object({
    enabled = bool
  })
  default = {
    enabled = false
  }
}

variable "openvswitch" {
  description = "Is openvswitch bridge used?"
  type        = bool
  default     = false
}
