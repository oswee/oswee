resource "vault_github_auth_backend" "github" {
  organization = var.github_organization
}
