resource "vault_github_user" "dzintars" {
  backend  = vault_github_auth_backend.oswee.id
  user     = "dzintars"
  policies = ["admin"]
}
