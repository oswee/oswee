module "instance" {
  source = "../../../../../modules/libvirt-domain"

  fqdn          = "${var.instance.hostname}.${var.local_root_domain}"
  hostname      = var.instance.hostname
  ssh_host_cert = false

  volume = {
    name = "${var.instance.hostname}.${var.local_root_domain}"
    pool = var.volume.pool
  }

  cloudinit = {
    name        = "${var.instance.hostname}.${var.local_root_domain}"
    dhcp        = false
    nameservers = ["1.1.1.1", "9.9.9.9"]
    # nameservers = {
    #   ns1 = "1.1.1.1"
    #   ns2 = "9.9.9.9"
    #   ns3 = null
    # }
  }

  addresses = ["${var.instance.ip_address}/16"]
  gateway   = var.gateway_ip

  vm = {
    user             = var.instance.user
    user_ssh_pub_key = tls_private_key.ansible.public_key_openssh
    hostname         = "${var.instance.hostname}.${var.local_root_domain}"
    domain           = var.local_root_domain
  }

  vault = {
    address = var.vault.address
    # role_id   = module.vault-ssh.approle.role
    # secret_id = module.vault-ssh.approle.secret
  }

  domain = {
    name   = "${var.instance.hostname}.${var.local_root_domain}"
    memory = var.instance.memory
    vcpu   = var.instance.vcpu
  }

  network = {
    name = var.network.name
  }
}
