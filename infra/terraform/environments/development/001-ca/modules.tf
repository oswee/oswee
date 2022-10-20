module "domain" {
  # source = "git@github.com:oswee/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  source = "../../../modules/libvirt-domain"

  volume = {
    name = "${var.instance_name}.${var.root_fqdn}"
    pool = data.terraform_remote_state.base.outputs.libvirt_pool.name
  }

  cloudinit = {
    name           = "${var.instance_name}.${var.root_fqdn}"
    dhcp           = true
    interface_name = "eth0"
    nameservers = {
      ns1 = null
      ns2 = null
      ns3 = null
    }
  }

  addresses = null
  gateway   = null

  vm = {
    user             = "ansible"
    user_ssh_pub_key = tls_private_key.ansible.public_key_openssh
    hostname         = var.instance_name
    domain           = "${var.root_fqdn}"
  }

  vault = {
    address   = "https://vault.example.local"
    role_id   = "role-id"
    secret_id = "secret-id"
  }

  domain = {
    name   = "${var.instance_name}.${var.root_fqdn}"
    memory = "1024"
    vcpu   = "1"
  }

  network = {
    name           = data.terraform_remote_state.base.outputs.management_network.name
    mac            = "74:6e:92:ae:83:e9"
    wait_for_lease = false
  }
}

module "vault" {
  source = "../../../modules/vault"
}

module "vault-ssh" {
  source = "../../../modules/vault-ssh"
  user            = "ansible"
}
