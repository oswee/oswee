data "template_file" "user_data" {
  template = file("${path.module}/templates/cloud_init.tpl")
  vars = {
    hostname         = local.vm.hostname
    domain           = var.vm.domain
    time_zone        = var.vm.time_zone
    user             = var.vm.user
    user_ssh_pub_key = var.vm.user_ssh_pub_key
    vault_address    = var.vault.address
    vault_role_id    = var.vault.role_id
    vault_secret_id  = var.vault.secret_id
  }
}

data "template_file" "network_config" {
  template = file("${path.module}/templates/network_config.tpl")
  vars = {
    mac            = local.network.mac
    dhcp           = var.cloudinit.dhcp
    interface_name = var.cloudinit.interface_name
    addresses      = jsonencode(var.addresses)
    gateway        = var.gateway
    nameservers    = jsonencode(var.nameservers)
  }
}
