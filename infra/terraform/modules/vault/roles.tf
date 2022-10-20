data "vault_auth_backend" "approle" {
  path = "approle"
}

// resource "vault_approle_auth_backend_role" "terraform" {
//   backend        = data.vault_auth_backend.approle.path
//   role_name      = "terraform"
//   token_policies = [vault_policy.terraform.name]
// }

// resource "vault_approle_auth_backend_role_secret_id" "terraform" {
//   backend   = data.vault_auth_backend.approle.path
//   role_name = vault_approle_auth_backend_role.terraform.role_name
// }

