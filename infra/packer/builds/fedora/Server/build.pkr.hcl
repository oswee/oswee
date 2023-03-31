build {
  /* sources = [ */
  /*   "source.qemu.fedora-Server", */
  /* ] */

  source "qemu.fedora_base_image" {
    name = "base"
  }

  /* source "qemu.fedora_hbi" { */
  /*   name = "qemu" */
  /* } */

  /* post-processor "vagrant" { */
  /* # TODO: Should be an variable */
  /*   output = "/home/dzintars/vagrant/boxes/${source.name}.box" */
  /*   output = "/var/lib/libvirt/images/${source.name}-test.qcow2" */
  /* } */

  /* post-processor "shell-local" { */
  /*   inline = [ */
  /*     "vagrant box add --force --name ${source.name} /home/dzintars/vagrant/boxes/${source.name}.box", */
  /*     "rm -rf output-${source.name}" */
  /*   ] */
  /* } */

  post-processor "shell-local" {
    /* only = ["qemu.fedora_base_image"] */
    inline = [
      "uname -a"
    ]
  }

  provisioner "ansible" {
    /* only                = ["qemu.fedora_base_image"] */
    user          = "vagrant"
    use_proxy     = false
    playbook_file = "${local.ansible_dir}/playbooks/base.yaml"
    /* galaxy_file         = "${local.ansible_dir}/requirements.yaml" */
    inventory_directory = "${local.ansible_dir}/environments/development"
    # Setting these should fix some of the (false alarm) warnings
    ansible_env_vars = [
      "ANSIBLE_CONFIG=${local.ansible_dir}/ansible.cfg",
      "ANSIBLE_BECOME_PASS=${var.build_password}",
    ]
    extra_arguments = [
      "--diff",
    ]
  }

  /* provisioner "ansible-local" { */
  /*   only = ["qemu.fedora_base_image"] */
  /*   // Use temporary installed ansible */
  /*   playbook_dir  = ${local.ansible_dir} */
  /*   playbook_file = "${local.ansible_dir}/root.yaml" */
  /*   command       = "/tmp/ansible/venv/bin/ansible-playbook" */
  /*   extra_arguments = [ */
  /*     "--extra-vars", "ansible_python_interpreter=/tmp/ansible/venv/bin/python" */
  /*   ] */
  /* } */

  /* provisioner "ansible" { */
  /*   except        = ["qemu.base"] */
  /*   playbook_file = "./provisioners/postinstall.yml" */
  /*   override = { */
  /*     vmware = { */
  /*       extra_arguments = ["--diff", "--tags", "vmware"] */
  /*     } */
  /*     azure = { */
  /*       extra_arguments = ["--diff", "--tags", "azure"] */
  /*     } */
  /*     hyper-v = { */
  /*       extra_arguments = ["--diff", "--tags", "hyper-v"] */
  /*     } */
  /*   } */
  /* } */

  /* post-processor "shell-local" { */
  /*   only = ["qemu.base"] */
  /*   inline = [ */
  /*     "source='${local.output_directory}/packer-linux_base_image'", */
  /*     "mv $source images/${local.full_name}-${var.target}-${var.firmware}.qcow2", */
  /*     "rm -rf ${local.output_directory}" */
  /*   ] */
  /* } */

  /* post-processor "shell-local" { */
  /*   only   = ["qemu.vmware"] */
  /*   script = "scripts/convert-diskimage.sh" */
  /*   environment_vars = [ */
  /*     "FORMAT=vmdk", */
  /*     "DIST_NAME=${local.full_name}", */
  /*     "TARGET=${var.target}-${var.firmware}", */
  /*     "IMAGE_PATH=${local.output_directory}/packer-linux_stage2", */
  /*     "DEBUG=true" */
  /*   ] */
  /* } */
}
