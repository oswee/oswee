variable "domain" {
  description = "Domain e.g. 'example.com'"
  type = object({
    name = string
  })
  default = {
    name = "example.local"
  }
}

variable "cluster_name" {
  description = "Name of the host e.g. [cluster_name].example.com"
  type        = string
  default     = "ocp"
}

variable "addresses" {
  description = ""
  type        = list(string)
  default     = ["192.168.123.0/24"]
}

variable "autostart" {
  description = ""
  type        = bool
  default     = false
}

variable "volume" {
  type = object({
    name = string
  })
  default = {
    name = "test"
  }
}

variable "network" {
  type = object({
    addresses = string
    dhcp = object({
      enabled = bool
    })
    dns = object({
      enabled = bool
    })
  })

  default = {
    addresses = "192.168.68.0/24"
    dhcp = {
      enabled = false
    }
    dns = {
      enabled = false
    }
  }
}
