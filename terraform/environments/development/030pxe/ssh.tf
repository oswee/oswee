resource "tls_private_key" "ansible" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
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
    # command = "ssh-keygen -R pxe.${var.env_name}.${var.global_fqdn}"
    command = "ssh-keygen -R pxe.dev.oswee.com"
  }
}
