output "domain_ip" {
  description = "The IP address of the CA Server"
  value       = module.domain.instance_ip_addr
}

# output "vault_ssh_client_public_key" {
#   description = "SSH Client CA Public Key"
#   value       = module.vault-ssh.client_ca_public_key
# }

# output "approle" {
#   description = "Instance approle parameters"
#   value = {
#     id = module.vault-ssh.approle.id
#     role = module.vault-ssh.approle.role
#     secret = module.vault-ssh.approle.secret
#   }
# }

# output "jenkins" {
#   description = "Jenkins approle parameters"
#   value = {
#     id = module.vault-ssh.jenkins.id
#     role = module.vault-ssh.jenkins.role
#     secret = module.vault-ssh.jenkins.secret
#   }
# }
