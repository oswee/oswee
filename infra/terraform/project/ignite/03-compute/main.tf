module "vault" {
  source = "./modules/vault"

  instance = {
    name       = var.vault.hostname
    hostname   = var.vault.hostname
    ip_address = var.vault.ip_address
    user       = var.vault.user
  }

  gateway_ip        = var.gateway_ip
  local_root_domain = var.local_root_domain

  volume = {
    pool = data.terraform_remote_state.storage.outputs.pool.name
  }
  network = {
    name = data.terraform_remote_state.network.outputs.name
  }
  vault = {
    address = var.vault_url
  }
  ansible_ssh_key_name = "ansible_${var.vault.hostname}_dev_ed25519"

  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = data.terraform_remote_state.dns.outputs.root_zone_id
  public_ip_address    = var.public_ip_address
}
