resource "null_resource" "instance_config" {
  triggers = {
    #   # When compute is modified, we need to run Ansible again
    #   domain = module.compute
    always_run = "${timestamp()}"
  }

  # Be sure your DNS can resolve the domain of this instance. Most likely you
  # need to add temporary record to the /etc/hosts before applying this module.
  # This module waits for guest to boot up so that we can move on and execute Ansible role.
  # TODO: Use dynamic keys
  provisioner "remote-exec" {
    inline = ["echo Waiting for SSH..."]
    connection {
      type        = "ssh"
      host        = var.instance.hostname
      user        = "ansible"
      private_key = tls_private_key.ansible.private_key_pem
      # certificate = file("/home/dzintars/.ssh/id_ed25519-cert.pub")
      # host_key    = tls_private_key.ansible.private_key_pem
    }
  }

  provisioner "local-exec" {
    working_dir = "../../../ansible"
    command     = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i environments/development playbooks/vault.yaml -t vault.setup"
  }

  depends_on = [
    module.compute,
    local_file.ansible_ssh_priv_key,
    cloudflare_record.vault,
  ]
}

resource "null_resource" "vault_init" {
  provisioner "local-exec" {
    working_dir = "../../../ansible"
    command     = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i environments/development playbooks/vault.yaml -t vault.init"
  }

  depends_on = [
    null_resource.instance_config,
  ]
}

# TODO: Remove local secrets when destroying instance.
