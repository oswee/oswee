data "local_file" "admin_policy" {
  filename = "${path.module}/policies/policy.admin.hcl"
}
