variable "headless" {
  type    = bool
  default = true
}

variable "type" {
  description = "Workstation, Server, or Net"
  type        = string
  default     = "Server"
}

variable "version" {
  type    = string
  default = "35"
}

variable "release" {
  type    = string
  default = "1.2"
}

variable "password" {
  type    = string
  default = "vagrant"
}
