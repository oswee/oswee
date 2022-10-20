variable "vault_addr" {
  description = "Vault Address URL"
  type        = string
  default     = "https://vault.example.com"
}

variable "vault_audit_log_file_path" {
  type        = string
  description = "Vault audit log file location. The directory must exist and the Vault daemon user must have write permissions to it. Done via Ansible role."
  default     = "/var/log/vault/audit.log"
}
