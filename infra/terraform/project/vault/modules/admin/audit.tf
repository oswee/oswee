resource "vault_audit" "oswee" {
  type = "file"

  options = {
    file_path = var.vault_audit_log_file_path
  }
}
