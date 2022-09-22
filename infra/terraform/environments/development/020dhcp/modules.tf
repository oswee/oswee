module "domain" {
  # source = "git@github.com:oswee/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  source = "../../../../../../oswee/terraform-libvirt-domain"

  volume = {
    name = "${var.instance_name}.${var.env_name}.${var.global_fqdn}"
    pool = data.terraform_remote_state.base.outputs.libvirt_pool.name
  }

  cloudinit = {
    name           = "${var.instance_name}.${var.env_name}.${var.global_fqdn}"
    dhcp           = false
    interface_name = var.interface_name
    nameservers = {
      ns1 = "192.168.200.253"
      ns2 = "1.1.1.1"
    }
  }

  addresses = var.network_addresses
  gateway   = var.default_gateway

  vm = {
    user             = "ansible"
    user_ssh_pub_key = tls_private_key.ansible.public_key_openssh
    hostname         = var.instance_name
    domain           = "${var.env_name}.${var.global_fqdn}"
  }

  vault = {
    address   = "https://vault.example.local"
    role_id   = "role-id"
    secret_id = "secret-id"
  }

  domain = {
    name   = "${var.instance_name}.${var.env_name}.${var.global_fqdn}"
    memory = "1024"
    vcpu   = "2"
  }

  network = {
    name           = data.terraform_remote_state.base.outputs.management_network.name
    mac            = var.network_mac
    wait_for_lease = false
  }
}

