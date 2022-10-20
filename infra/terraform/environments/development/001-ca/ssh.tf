resource "tls_private_key" "ansible" {
  algorithm   = "ED25519"
}

resource "local_file" "ansible_ssh_priv_key" {
  content         = tls_private_key.ansible.private_key_pem
  filename        = pathexpand("~/.ssh/${var.ansible_ssh_key_name}")
  file_permission = "0600"

  provisioner "local-exec" {
    command = "ssh-add ${pathexpand("~/.ssh/${var.ansible_ssh_key_name}")}"
  }

  provisioner "local-exec" {
    when = destroy
    # command = "ssh-keygen -R ${var.instance_name}.${var.root_fqdn}"
    command = "ssh-keygen -R ca.oswee.dev"
  }
}
