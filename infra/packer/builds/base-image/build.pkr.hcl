build {
  source "qemu.base_image" {
    name = "base-image"
  }

  provisioner "shell" {
    name = "run-scripts"
    only = [
      "qemu.base-image",
    ]
    execute_command = "echo '${var.build_password}' | {{.Vars}} sudo -E -S sh -eux '{{.Path}}'"
    environment_vars = [
      "BUILD_USERNAME=${var.build_username}",
      "BUILD_KEY=${var.build_ssh_key}"
    ]
    scripts = formatlist("${path.cwd}/%s", var.scripts)
  }

  /* provisioner "ansible" { */
  /*   user          = "vagrant" */
  /*   use_proxy     = false */
  /*   playbook_file = "${local.ansible_dir}/playbooks/base.yaml" */
  /*   inventory_directory = "${local.ansible_dir}/environments/development" */
  /*   ansible_env_vars = [ */
  /*     "ANSIBLE_CONFIG=${local.ansible_dir}/ansible.cfg", */
  /*     "ANSIBLE_BECOME_PASS=${var.build_password}", */
  /*   ] */
  /*   extra_arguments = [ */
  /*     "--diff", */
  /*   ] */
  /* } */

  post-processor "shell-local" {
    name = "copy-base-artifact"
    only = [
      "qemu.base-image",
    ]
    inline = [
      "cp -r ${var.output_directory}/${local.dist_name}-${var.target}* ${var.qemu_registry_path}/artifacts/${local.dist_name}-${var.target}",
    ]
  }

  post-processor "shell-local" {
    name = "calculate-md5"
    only = [
      "qemu.base-image",
    ]
    inline = [
      "ARTIFACTS_DIR=${var.qemu_registry_path}/artifacts/${local.dist_name}-${var.target}",
      "md5sum $ARTIFACTS_DIR/${var.vm_name}.qcow2 | cut -d' ' -f1 > $ARTIFACTS_DIR/${var.vm_name}.md5"
    ]
  }

  post-processor "vagrant" {
    name   = "create-vagrant-box"
    only   = ["qemu.base-image"]
    output = "${var.vagrant_registry_path}/boxes/${source.name}.box"
  }

  post-processor "shell-local" {
    name = "register-vagrant-box"
    only = [
      "qemu.base-image",
    ]
    inline = [
      "vagrant box add --force --name ${source.name} ${var.vagrant_registry_path}/boxes/${source.name}.box",
    ]
  }

  post-processor "shell-local" {
    name = "remove-output"
    only = [
      "qemu.base-image",
    ]
    inline = [
      "rm -rf ${var.output_directory}/${local.dist_name}-${var.target}"
    ]
  }
}
