module "domain" {
  # source = "git@github.com:oswee/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  source = "../../../../modules/libvirt-domain"

  volume = {
    name = var.volume.name
    pool = var.volume.pool
  }

  cloudinit = {
    name = var.cloudinit.name
    dhcp = false
    nameservers = {
      ns1 = "1.1.1.1"
      ns2 = "9.9.9.9"
      ns3 = null
    }
  }

  addresses = var.addresses
  gateway   = var.gateway

  vm = {
    user = var.vm.user
    # user_ssh_pub_key = tls_private_key.ansible.public_key_openssh
    hostname = var.vm.hostname
    domain   = var.vm.domain
  }

  # vault = {
  #   address   = var.vault_url
  #   role_id   = module.vault-ssh.approle.role
  #   secret_id = module.vault-ssh.approle.secret
  # }

  domain = {
    name   = var.domain.name
    memory = "1024"
    vcpu   = "2"
  }

  network = {
    name           = var.network.name
    mac            = var.network.mac
    wait_for_lease = false
  }
}
