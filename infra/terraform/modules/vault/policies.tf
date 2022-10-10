# resource "vault_policy" "terraform" {
#   name   = "terraform"
#   policy = data.local_file.terraform_policy.content
# }

resource "vault_policy" "admin" {
  name   = "admins"
  policy = data.local_file.admin_policy.content
}

resource "vault_policy" "developer" {
  name   = "developers"
  policy = data.local_file.developer_policy.content
}

resource "vault_policy" "operations" {
  name   = "operations"
  policy = data.local_file.operations_policy.content
}

