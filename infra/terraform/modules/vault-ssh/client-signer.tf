resource "vault_mount" "ssh_client_signer" {
  description = "SSH Certs user key signer"
  path        = "ssh-client-signer"
  type        = "ssh"
}

resource "tls_private_key" "client" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
}

resource "vault_ssh_secret_backend_ca" "client_ca" {
  backend		  = vault_mount.ssh_client_signer.path
  private_key = tls_private_key.client.private_key_pem
  public_key  = tls_private_key.client.public_key_openssh
}

resource "vault_ssh_secret_backend_role" "clientrole" {
  name                    = "clientrole"
  backend                 = vault_mount.ssh_client_signer.path
  key_type                = "ca"
  allow_user_certificates = "true"
  allowed_users           = "*"
  allowed_extensions      = var.allowed_extensions
  default_extensions      = var.default_extensions
  default_user            = var.user
  cidr_list               = "0.0.0.0/0"
  ttl                     = "16h"
  max_ttl                 = "16h"
}
