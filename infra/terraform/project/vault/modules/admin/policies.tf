# Use local file policies to keep this code clean.
resource "vault_policy" "admin" {
  name   = "admin"
  policy = data.local_file.admin_policy.content
}
