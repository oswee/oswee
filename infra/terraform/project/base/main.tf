module "network" {
  source       = "./modules/network"
  network_name = var.network_name
}

module "storage" {
  source    = "./modules/storage"
  pool_name = "s3.oswee.dev"
  pool_path = "/mnt/data/libvirt"
}

module "tls" {
  source = "./modules/tls"
}

module "cloudflare" {
  source                = "./modules/cloudflare"
  cloudflare_api_token  = var.cloudflare_api_token
  cloudflare_account_id = var.cloudflare_account_id
  public_ip_address     = var.public_ip_address
  root_domain           = var.root_domain
}

# TODO: I don't like this repetition!!!
# module "bastion" {
#   source               = "./modules/bastion"
#   fqdn                 = "${var.bastion.hostname}.${var.root_domain}"
#   hostname             = var.bastion.hostname
#   ansible_ssh_key_name = "ansible_${var.bastion.hostname}_dev_ed25519"
#   volume = {
#     name = "${var.bastion.hostname}.${var.root_domain}"
#     pool = module.storage.pool.name
#   }
#   cloudinit = {
#     name = "${var.bastion.hostname}.${var.root_domain}"
#   }
#   addresses = ["${var.bastion.ip_address}/16"]
#   gateway   = var.gateway_ip
#   vm = {
#     domain   = var.root_domain
#     hostname = "${var.bastion.hostname}.${var.root_domain}"
#     user     = var.bastion.user
#   }
#   domain = {
#     name = "${var.bastion.hostname}.${var.root_domain}"
#   }
#   network = {
#     name = module.network.name
#   }
#   vault = {
#     address = var.vault_address
#   }
#   cloudflare_api_token    = var.cloudflare_api_token
#   cloudflare_root_zone_id = module.cloudflare.root_zone_id
#   public_ip_address       = var.public_ip_address
# }
#
# module "vault" {
#   source               = "./modules/vault"
#   fqdn                 = "${var.vault.hostname}.${var.root_domain}"
#   hostname             = var.vault.hostname
#   ansible_ssh_key_name = "ansible_${var.vault.hostname}_dev_ed25519"
#   volume = {
#     name = "${var.vault.hostname}.${var.root_domain}"
#     pool = module.storage.pool.name
#   }
#   cloudinit = {
#     name = "${var.vault.hostname}.${var.root_domain}"
#   }
#   addresses = ["${var.vault.ip_address}/16"]
#   gateway   = var.gateway_ip
#   vm = {
#     domain   = var.root_domain
#     hostname = "${var.vault.hostname}.${var.root_domain}"
#     user     = var.vault.user
#   }
#   domain = {
#     name = "${var.vault.hostname}.${var.root_domain}"
#   }
#   network = {
#     name = module.network.name
#   }
#   vault = {
#     address = var.vault_address
#   }
#   cloudflare_api_token    = var.cloudflare_api_token
#   cloudflare_root_zone_id = module.cloudflare.root_zone_id
#   public_ip_address       = var.public_ip_address
# }
