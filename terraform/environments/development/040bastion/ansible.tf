resource "null_resource" "bastion_config" {
  # triggers = {
  #   bastion = module.bastion
  # }

  provisioner "remote-exec" {
    inline = ["echo Waiting for SSH..."]
    connection {
      host        = var.instance_name
      type        = "ssh"
      user        = "ansible"
      private_key = tls_private_key.ansible.private_key_pem
    }
  }

  # https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
  provisioner "local-exec" {
    working_dir = "../../../../ansible"
    command     = "ansible-playbook -i environments/development playbooks/bastion.yml"
  }

  depends_on = [
    local_file.ansible_ssh_priv_key,
    module.bastion,
  ]
}


