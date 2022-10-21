resource "null_resource" "instance_config" {
  # triggers = {
  #   domain = module.domain
  # }

  # Be sure your DNS can resolve the domain of this instance. Most likely you
  # need to add temporary record to the /etc/hosts before applying this module.
  # This module waits for guest to boot up so that we can move on and execute Ansible role.
  # provisioner "remote-exec" {
  #   inline = ["echo Waiting for SSH..."]
  #   connection {
  #     type        = "ssh"
  #     host        = var.instance_name
  #     user        = "ansible"
  #     # TODO: I don't like to use static files!
  #     private_key = "${file("/home/dzintars/.ssh/id_ed25519")}"
  #     certificate = "${file("/home/dzintars/.ssh/id_ed25519-cert.pub")}"
  #   }
  # }

  # TODO: Use dynamic keys
  provisioner "remote-exec" {
    inline = ["echo Waiting for SSH..."]
    connection {
      type        = "ssh"
      host        = var.hostname
      user        = "ansible"
      private_key = tls_private_key.ansible.private_key_pem
      # certificate = file("/home/dzintars/.ssh/id_ed25519-cert.pub")
      # host_key    = tls_private_key.ansible.private_key_pem
    }
  }

  # https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
  provisioner "local-exec" {
    working_dir = "../../../ansible"
    command     = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i environments/development playbooks/vault.yaml"
  }

  depends_on = [
    local_file.ansible_ssh_priv_key,
    module.domain,
  ]
}
