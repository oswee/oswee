output "client_ca_public_key" {
 value = vault_ssh_secret_backend_ca.client_ca.public_key
}

output "approle" {
  value = {
    id = vault_approle_auth_backend_role.instance.id
    role = vault_approle_auth_backend_role.instance.role_id
    secret = vault_approle_auth_backend_role_secret_id.instance.secret_id
  }
}

output "jenkins" {
  value = {
    id = vault_approle_auth_backend_role.jenkins.id
    role = vault_approle_auth_backend_role.jenkins.role_id
    secret = vault_approle_auth_backend_role_secret_id.jenkins.secret_id
  }
}
