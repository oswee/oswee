resource "random_pet" "instance" {}

module "dhcp" {
  # source = "git@github.com:dzintars/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  source = "../../../../../../dzintars/terraform-libvirt-domain"

  volume = {
    name = "dhcp.${var.env_name}.${var.global_fqdn}"
    pool = data.terraform_remote_state.base.outputs.libvirt_pool.name
  }

  cloudinit = {
    name           = "dhcp.${var.env_name}.${var.global_fqdn}"
    dhcp           = false
    interface_name = "eth0"
    addresses      = "192.168.67.253/24"
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
    hostname         = "dhcp"
    domain           = "dhcp.${var.env_name}.${var.global_fqdn}"
  }

  vault = {
    address   = "https://vault.example.local"
    role_id   = "role-id"
    secret_id = "secret-id"
  }

  domain = {
    name   = "dhcp.${var.env_name}.${var.global_fqdn}"
    memory = "1024"
    vcpu   = "2"
  }

  network = {
    name           = data.terraform_remote_state.base.outputs.libvirt_network.name
    mac            = "3a:72:7b:74:25:b4"
    wait_for_lease = false
  }
}

resource "null_resource" "dhcp_config" {
  # triggers = {
  #   dhcp = module.dhcp
  # }

  provisioner "remote-exec" {
    inline = ["echo Waiting for SSH..."]
    connection {
      host        = "dhcp"
      type        = "ssh"
      user        = "ansible"
      private_key = tls_private_key.ansible.private_key_pem
    }
  }

  # https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
  provisioner "local-exec" {
    working_dir = "../../../../ansible"
    command     = <<EOT
      ansible-playbook playbooks/dhcp.yml
    EOT
  }

  depends_on = [
    local_file.ansible_ssh_priv_key,
    module.dhcp,
  ]
}

