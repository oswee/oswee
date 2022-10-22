# Generate self-signed TLS certificates. Unlike @kelseyhightower's original
# demo, this does not use cfssl and uses Terraform's internals instead.
resource "tls_private_key" "root-ca" {
  algorithm = "ED25519"
}

resource "tls_self_signed_cert" "root-ca" {
  private_key_pem = tls_private_key.root-ca.private_key_pem

  subject {
    country             = "LV"
    organization        = "Oswee"
    organizational_unit = "Root CA"
    common_name         = "Oswee Root CA"
  }

  validity_period_hours = 8760
  is_ca_certificate     = true

  allowed_uses = [
    "cert_signing",
    "digital_signature",
    "key_encipherment",
  ]

  provisioner "local-exec" {
    command = "echo '${self.cert_pem}' > .tls/ca.pem && chmod 0600 .tls/ca.pem"
  }
}
