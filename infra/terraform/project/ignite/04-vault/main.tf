module "admin" {
  source              = "./modules/admin"
  vault_addr          = var.vault.address
  github_organization = var.github_organization
  github_user         = var.github_user
}
