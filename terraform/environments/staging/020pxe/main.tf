resource "random_pet" "instance" {}

module "pxe" {
  # source = "git@github.com:dzintars/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  source = "../../../../../dzintars/terraform-libvirt-domain"

  volume = {
    name = "pxe"
    pool = module.libvirt_pool.name
  }

  cloudinit = {
    name           = "pxe.${terraform.workspace}.oswee.com"
    dhcp           = true
    interface_name = "eth0"
    addresses      = "192.168.67.252/24"
    gateway        = "192.168.67.1"
    nameservers = {
      ns1 = "1.1.1.1"
      ns2 = "9.9.9.9"
      ns3 = null
    }
  }

  vm = {
    user             = "ansible"
    user_ssh_pub_key = tls_private_key.ansible.public_key_openssh
    hostname         = "pxe"
    domain           = "${terraform.workspace}.oswee.com"
  }

  vault = {
    address   = "https://vault.example.local"
    role_id   = "role-id"
    secret_id = "secret-id"
  }

  domain = {
    name   = "pxe"
    memory = "1024"
    vcpu   = "2"
  }

  network = {
    name           = module.libvirt_network.name
    mac            = "f4:ce:30:a8:12:93"
    wait_for_lease = true
  }
}

