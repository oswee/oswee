variable "domain" {
  description = "Domain e.g. 'example.com'"
  type        = string
  default     = "example.local"
}

variable "cluster_name" {
  description = "Name of the host e.g. [cluster_name].example.com"
  type        = string
  default     = "ocp"
}

variable "addresses" {
  description = ""
  type        = list(string)
  default     = ["192.168.122.0/24"]
}

variable "autostart" {
  description = ""
  type        = bool
  default     = false
}
