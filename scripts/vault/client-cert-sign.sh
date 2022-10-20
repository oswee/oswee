#!/bin/sh

set -eu -o pipefail

vault_address=https://vault.oswee.com
token_path=~/.secrets/vault/root/rootkey
ssh_pub_key_path=~/.ssh/id_ed25519.pub
ssh_cert_path=~/.ssh/id_ed25519-cert.pub

# It is better to use Curl insted vault commnad as we don't know where the Vault instance will be running
curl -sS \
  -H "X-Vault-Token: $(cat $token_path)" \
  -X POST \
  -d @- "$vault_address/v1/ssh-client-signer/sign/clientrole" <<-EOF | jq -r .data.signed_key > $ssh_cert_path
{
  "public_key": "$(cat $ssh_pub_key_path)",
  "cert_type": "user"
}
EOF
