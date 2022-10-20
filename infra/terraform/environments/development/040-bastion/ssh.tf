resource "tls_private_key" "ansible" {
  algorithm   = "ED25519"
}

resource "local_file" "ansible_ssh_priv_key" {
  content         = tls_private_key.ansible.private_key_pem
  filename        = pathexpand("~/.ssh/${var.ansible_ssh_key_name}")
  file_permission = "0400"

  provisioner "local-exec" {
    command = "ssh-add ${pathexpand("~/.ssh/${var.ansible_ssh_key_name}")}"
  }

  provisioner "local-exec" {
    when = destroy
    command = "ssh-keygen -R bastion.${var.root_fqdn}"
  }
}
