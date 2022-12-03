module "admin" {
  source = "./modules/admin"
  depends_on = [
    null_resource.vault_init,
  ]
  vault_addr          = var.vault.address
  github_organization = var.github_organization
  github_user         = var.github_user
}
