data "template_file" "user_data" {
  template = file("${path.module}/templates/cloud_init.tpl")
  vars = {
    user             = local.vm.user
    user_ssh_pub_key = local.vm.user_ssh_pub_key
    hostname         = local.vm.hostname
    domain           = local.vm.domain
    time_zone        = local.vm.time_zone
    vault_address    = var.vault.address
    vault_role_id    = var.vault.role_id
    vault_secret_id  = var.vault.secret_id
  }
}

data "template_file" "network_config" {
  template = file("${path.module}/templates/network_config.tpl")
  vars = {
    mac            = local.network.mac
    dhcp           = local.cloudinit.dhcp
    interface_name = local.cloudinit.interface_name
    addresses      = jsonencode(var.addresses)
    gateway        = var.gateway
    nameservers    = jsonencode(var.nameservers)
  }
}
