resource "local_file" "ansible_ssh_priv_key" {
  content         = tls_private_key.root-ca.private_key_pem
  filename        = pathexpand("~/.ssh/ansible_ecdsa")
  file_permission = "0600"

  provisioner "local-exec" {
    command = "ssh-add ${pathexpand("~/.ssh/ansible_ecdsa")}"
  }
}
