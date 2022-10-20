module "vault-admin" {
  source = "../../../modules/vault-admin"
  vault_addr = var.vault_addr
}

# module "vault" {
#   source = "../../../modules/vault"
# }
#
# module "vault-ssh" {
#   source = "../../../modules/vault-ssh"
#   user            = "ansible"
# }

# Create the Vault server certificates
resource "tls_private_key" "vault" {
  algorithm = "ED25519"
}

# Create the request to sign the cert with our CA
resource "tls_cert_request" "vault" {
  private_key_pem = tls_private_key.vault.private_key_pem

  dns_names = [
    "vault",
    "vault.local",
    "vault.default.svc.cluster.local",
  ]

  ip_addresses = [
    "192.168.100.1",
  ]

  subject {
    common_name  = "vault.local"
    organization = "HashiCorp Vault"
  }
}

# Now sign the cert
resource "tls_locally_signed_cert" "vault" {
  cert_request_pem = tls_cert_request.vault.cert_request_pem

  ca_private_key_pem = tls_private_key.root-ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.root-ca.cert_pem

  validity_period_hours = 8760

  allowed_uses = [
    "cert_signing",
    "client_auth",
    "digital_signature",
    "key_encipherment",
    "server_auth",
  ]

  # provisioner "local-exec" {
  #   command = "echo '${self.cert_pem}' > tls/vault.pem && echo '${tls_self_signed_cert.vautl-ca.cert_pem}' >> tls/vault.pem && chmod 0600 tls/vault.pem"
  # }
}
