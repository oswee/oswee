variable "vault_addr" {
  description = "Vault Address URL"
  type        = string
  default     = "https://vault.oswee.com"
}

variable "allowed_extensions" {
  description = "(optional)"
  type        = string
  default     = "permit-pty,permit-port-forwarding"
}

variable "default_extensions" {
  description = "(optional)"
  type        = map(string)
  default     = {"permit-pty": ""}
}

variable "user" {
  description = ""
  type        = string
  default     = "fedora"
}
