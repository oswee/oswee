data "template_file" "user_data" {
  template = file("${path.module}/templates/cloud_init.tpl")
  vars = {
    fqdn                  = var.fqdn
    hostname              = local.hostname
    time_zone             = var.vm.time_zone
    user                  = var.vm.user
    user_ssh_pub_key      = var.vm.user_ssh_pub_key
    vault_address         = var.vault.address
    ssh_host_cert         = var.ssh_host_cert
    ssh_host_cert_script  = data.template_file.host_cert_script.rendered
    ssh_host_cert_service = data.template_file.host_cert_service.rendered
    ssh_host_cert_timer   = data.template_file.host_cert_timer.rendered
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
    # nameservers    = jsonencode(var.nameservers)
    nameservers = "[\"1.1.1.1\", \"9.9.9.9\"]"
  }
}

data "template_file" "host_cert_script" {
  template = file("${path.module}/templates/ssh/host-cert.sh.tpl")
  vars = {
    vault_address   = var.vault.address
    vault_role_id   = var.vault.role_id
    vault_secret_id = var.vault.secret_id
  }
}

data "template_file" "host_cert_service" {
  template = file("${path.module}/templates/ssh/host-cert.service.tpl")
}

data "template_file" "host_cert_timer" {
  template = file("${path.module}/templates/ssh/host-cert.timer.tpl")
}
