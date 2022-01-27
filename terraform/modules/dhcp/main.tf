module "bastion" {
  source = "git@github.com:dzintars/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  pool = {
    name = libvirt_pool.pool.name
  }

  volume = {
    pool = libvirt_pool.pool.name
  }

  cloudinit = {}

  vm = {
    user = "ansible"
  }

  vault = {
    address   = "https://vault.example.local"
    role_id   = "role-id"
    secret_id = "secret-id"
  }

  domain = {
    memory = "2048"
    vcpu   = "2"
  }

  network = {
    name = libvirt_network.network.name
  }
}
