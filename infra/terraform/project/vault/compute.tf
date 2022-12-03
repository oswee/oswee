module "compute" {
  source = "./modules/compute"

  instance = {
    name       = var.instance.hostname
    hostname   = var.instance.hostname
    ip_address = var.instance.ip_address
    user       = var.instance.user
    memory     = var.instance.memory
    vcpu       = var.instance.vcpu
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
    address = var.vault.address
  }
  user_ssh_pub_key = tls_private_key.ansible.public_key_openssh
}
