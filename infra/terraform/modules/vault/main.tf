terraform {
  required_version = ">= 1.3.1"

  required_providers {
    vault = ">= 3.9.1"
  }
}

provider "vault" {
  address = var.vault_addr
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
