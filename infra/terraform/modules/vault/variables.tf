variable "vault_addr" {
  description = "Vault Address URL"
  type        = string
  default     = "https://vault.oswee.com"
}

variable "user" {
  description = ""
  type        = string
  default     = "fedora"
}

variable "vault_audit_log_file_path" {
  type        = string
  description = "Vault audit log file location. The directory must exist and the Vault daemon user must have write permissions to it."
  default     = "/var/log/vault/audit.log"
}
