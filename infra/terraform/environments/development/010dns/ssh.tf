# Generate new SSH key
resource "tls_private_key" "ansible" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
}

# Write generated SSH key into file
resource "local_file" "ansible_ssh_priv_key" {
  content         = tls_private_key.ansible.private_key_pem
  filename        = pathexpand("~/.ssh/${var.ansible_ssh_key_name}")
  file_permission = "0600"

  # provisioner "local-exec" {
  #   command = "ssh-add ${pathexpand("~/.ssh/${var.ansible_ssh_key_name}")}"
  # }

  # Remove the known_hosts entry when this resource is destroyed
  provisioner "local-exec" {
    when = destroy
    # command = "ssh-keygen -R ${var.instance_name}.${var.env_name}.${var.global_fqdn}"
    command = "ssh-keygen -R ns1.dev.oswee.com"
  }
}
