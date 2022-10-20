#!/bin/sh

set -eu -o pipefail

token_path=/root/.vault-token
ssh_pub_key_path=/etc/ssh/ssh_host_ed25519_key.pub
ssh_cert_path=/etc/ssh/ssh_host_ed25519_key-cert.pub

echo "Authenticating with Vault"

curl -sS \
  -X POST \
  -d @- "${vault_address}/v1/auth/approle/login" <<-EOF | jq -r '.auth.client_token' > $token_path
{
  "role_id": "${vault_role_id}",
  "secret_id": "${vault_secret_id}"
}
EOF

echo "Successfully authenticated with Vault"

echo "Signing host certificate"

curl -sS \
  -H "X-Vault-Token: $(cat $token_path)" \
  -X POST \
  -d @- "${vault_address}/v1/ssh-host-signer/sign/hostrole" <<-EOF | jq -r .data.signed_key > $ssh_cert_path
{
  "public_key": "$(cat $ssh_pub_key_path)",
  "cert_type": "host"
}
EOF

chmod 0640 $ssh_cert_path

echo "Successfully signed ssh host certificate!"
