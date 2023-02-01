#!/bin/sh

set -eu -o pipefail

vault_address=https://vault.oswee.com
token_path=/home/dzintars/.secrets/vault/root/rootkey
ssh_pub_key_path=/etc/ssh/ssh_host_ed25519_key
ssh_cert_path=/etc/ssh/ssh_host_ed25519_key-cert.pub

curl -sS \
  -H "X-Vault-Token: $(cat $token_path)" \
  -X POST \
  -d @- "$vault_address/v1/ssh-host-signer/sign/hostrole" <<-EOF | jq -r .data.signed_key > $ssh_cert_path
{
  "public_key": "$(cat $ssh_pub_key_path)",
  "cert_type": "host"
}
EOF
