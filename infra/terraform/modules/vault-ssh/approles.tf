# data "vault_auth_backend" "approle" {
#   path = "approle"
# }

# Create approle backend
resource "vault_auth_backend" "approle" {
  type = "approle"
  path = "approle"
}

data "vault_policy_document" "instance" {
  rule {
    path         = "ssh-host-signer/sign/hostrole"
    capabilities = ["update"]
    description  = "Allow hosts to sign their own certs"
  }
}

data "vault_policy_document" "jenkins" {
  rule {
    path         = "ssh-client-signer/sign/clientrole"
    capabilities = ["update"]
    description  = "Allow Jenkins to sign its own ssh certs"
  }
}

# Create the policy
resource "vault_policy" "instance" {
  name   = "instance"
  policy = data.vault_policy_document.instance.hcl
}

# Create the Jenkins policy
resource "vault_policy" "jenkins" {
  name   = "jenkins"
  policy = data.vault_policy_document.jenkins.hcl
}

# Create the role and assign the policy
resource "vault_approle_auth_backend_role" "instance" {
  backend        = vault_auth_backend.approle.path
  role_name      = "instance"
  token_policies = ["default", vault_policy.instance.name]
}

# Create the Jenkins role and assign the policy
resource "vault_approle_auth_backend_role" "jenkins" {
  backend        = vault_auth_backend.approle.path
  role_name      = "jenkins"
  token_policies = [vault_policy.jenkins.name]
}

# Create the secret which to inject into instance
resource "vault_approle_auth_backend_role_secret_id" "instance" {
  backend = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.instance.role_name
}

# Create the secret which to inject into Jenkins
resource "vault_approle_auth_backend_role_secret_id" "jenkins" {
  backend = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.jenkins.role_name
}
