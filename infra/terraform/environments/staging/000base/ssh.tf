resource "tls_private_key" "ansible" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
}

resource "local_file" "ansible_ssh_priv_key" {
  content         = tls_private_key.ansible.private_key_pem
  filename        = pathexpand("~/.ssh/ansible_ecdsa")
  file_permission = "0600"

  provisioner "local-exec" {
    command = "ssh-add ${pathexpand("~/.ssh/ansible_ecdsa")}"
  }
}
