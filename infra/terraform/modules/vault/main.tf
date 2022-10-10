resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

# resource "vault_auth_backend" "approle" {
#   type = "approle"
#   path = "approle"
# }

resource "vault_mount" "developers" {
  path        = "developers"
  type        = "kv-v2"
  description = "KV2 Secrets Engine for Developers"
}

resource "vault_mount" "operations" {
  path        = "operations"
  type        = "kv-v2"
  description = "KV2 Secrets Engine for Operations"
}
