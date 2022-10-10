data "local_file" "terraform_policy" {
  filename = "${path.module}/policies/policy.terraform.hcl"
}

data "local_file" "admin_policy" {
  filename = "${path.module}/policies/policy.admin.hcl"
}

data "local_file" "developer_policy" {
  filename = "${path.module}/policies/policy.developer.hcl"
}

data "local_file" "operations_policy" {
  filename = "${path.module}/policies/policy.operations.hcl"
}

data "template_file" "ssh_user_role" {
  template = file("${path.module}/roles/ssh.user.hcl")
  vars = {
    user = var.user
  }
}
