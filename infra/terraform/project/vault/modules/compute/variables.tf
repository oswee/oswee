variable "instance" {
  description = ""
  type = object({
    name       = string
    hostname   = string
    ip_address = string
    user       = string
    memory     = string
    vcpu       = string
  })
  default = {
    name       = "instance"
    hostname   = "instance"
    ip_address = "192.168.0.0"
    user       = "admin"
    memory     = "512"
    vcpu       = "1"
  }
}

variable "local_root_domain" {
  description = ""
  type        = string
  default     = "example.local"
  sensitive   = true
}

variable "volume" {
  description = ""
  type = object({
    pool = string
  })
}

variable "gateway_ip" {
  description = ""
  type        = string
  default     = "192.168.0.0"
  sensitive   = true
}

variable "network" {
  description = ""
  type = object({
    name = string
  })
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

variable "user_ssh_pub_key" {
  description = ""
  type        = string
}