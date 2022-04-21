build {
  sources = [
    "source.qemu.fedora35",
  ]

  provisioner "shell" {
    execute_command = "echo '${var.build_password}' | {{.Vars}} sudo -E -S sh -eux '{{.Path}}'"
    environment_vars = [
      "BUILD_USERNAME=${var.build_username}",
      "BUILD_KEY=${var.build_key}"
    ]
    scripts = formatlist("${path.cwd}/%s", var.scripts)
  }

  /* provisioner "ansible" { */
  /*   playbook_file           = "${path.cwd}/ansible/main.yml" */
  /*   roles_path              = "${path.cwd}/ansible/roles" */
  /*   ansible_env_vars = [ */
  /*     "ANSIBLE_CONFIG=${path.cwd}/ansible/ansible.cfg" */
  /*   ] */
  /* } */

  post-processor "vagrant" {
    output = "${var.VAGRANT_BOX_PATH}/${source.name}.box"
  }

  post-processor "shell-local" {
    inline = [
      "vagrant box add --force --name ${source.name} ${var.VAGRANT_BOX_PATH}/${source.name}.box",
      "rm -rf output-${source.name}"
    ]
  }
}
