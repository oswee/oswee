module "vault-admin" {
  source     = "../../../../modules/vault-admin"
  vault_addr = var.vault.address
}
