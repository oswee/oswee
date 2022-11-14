resource "vault_github_user" "dev_admin" {
  backend  = vault_github_auth_backend.github.id
  user     = var.github_user
  policies = ["admin"]
}
