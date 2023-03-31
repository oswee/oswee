build {
  source "qemu.ci_image" {
    name = "ci-image"
  }

  provisioner "ansible" {
    only = [
      "qemu.ci-image",
    ]
    user                = "vagrant"
    use_proxy           = false
    playbook_file       = "${local.ansible_dir}/playbooks/base.yaml"
    inventory_directory = "${local.ansible_dir}/environments/development"
    ansible_env_vars = [
      "ANSIBLE_CONFIG=${local.ansible_dir}/ansible.cfg",
      "ANSIBLE_BECOME_PASS=${var.build_password}",
    ]
    extra_arguments = [
      "--diff",
    ]
  }

  post-processor "shell-local" {
    only = [
      "qemu.ci-image",
    ]
    inline = [
      "mv ${var.output_directory}/${local.dist_name}-${var.target}/* ${var.qemu_registry_path}/artifacts/${local.dist_name}-${var.target}",
      "rm -rf ${var.output_directory}/${local.dist_name}-${var.target}"
    ]
  }

  post-processor "shell-local" {
    only = [
      "qemu.ci-image",
    ]
    inline = [
      "ARTIFACTS_DIR=${var.qemu_registry_path}/artifacts/${local.dist_name}-${var.target}",
      "md5sum $ARTIFACTS_DIR/${var.vm_name}.qcow2 | cut -d' ' -f1 > $ARTIFACTS_DIR/${var.vm_name}.md5"
    ]
  }

}
