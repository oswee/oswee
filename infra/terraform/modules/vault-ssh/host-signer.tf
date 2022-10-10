resource "vault_mount" "ssh_host_signer" {
  description = "SSH Certs host public key signer"
  path        = "ssh-host-signer"
  type        = "ssh"
  max_lease_ttl_seconds = 315360000
}

resource "tls_private_key" "host" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
}

resource "vault_ssh_secret_backend_ca" "host_ca" {
  backend     = vault_mount.ssh_host_signer.path
  private_key = tls_private_key.host.private_key_pem
  public_key  = tls_private_key.host.public_key_openssh
}

resource "vault_ssh_secret_backend_role" "hostrole" {
  name                    = "hostrole"
  backend                 = vault_mount.ssh_host_signer.path
  key_type                = "ca"
  allow_host_certificates = "true"
  allowed_domains         = "localdomain,oswee.com"
  allow_subdomains        = true
  ttl                     = "87600h"
}
