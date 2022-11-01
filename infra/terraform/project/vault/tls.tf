# Generate new SSH key
resource "tls_private_key" "ansible" {
  algorithm = "ED25519"
}

# TODO: This stanza is used if SSH Host Certificate are not used
# Write generated SSH Private key to the file on local machine (TF executor)
resource "local_file" "ansible_ssh_priv_key" {
  content         = tls_private_key.ansible.private_key_openssh
  filename        = pathexpand("~/.ssh/${var.ansible_ssh_key_name}")
  file_permission = "0600"

  provisioner "local-exec" {
    command = "ssh-add ${pathexpand("~/.ssh/${var.ansible_ssh_key_name}")}"
  }

  # Remove the known_hosts entry when this resource is destroyed
  provisioner "local-exec" {
    when    = destroy
    command = "ssh-keygen -R vault.oswee.dev"
  }
}

# Write SSH config
# resource "local_file" "ansible_ssh_config" {
#   content         = templatefile("${path.module}/templates/ns1", {})
#   filename        = pathexpand("~/.ssh/config.d/${var.instance_name}")
#   file_permission = "0600"
#
#   # provisioner "local-exec" {
#   #   command = "sudo systemctl restart sshd.service"
#   # }
#
#   # Remove the known_hosts entry when this resource is destroyed
#   # provisioner "local-exec" {
#   #   when = destroy
#   #   command = "rm ~/.ssh/config.d/${var.instance_name}"
#   # }
# }
