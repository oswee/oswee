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


  /*  provisioner "ansible" { */
  /*   only            = ["qemu.base"] */
  /*   playbook_file   = "./provisioners/postinstall.yml" */
  /*   extra_arguments = ["--diff"] */
  /*   max_retries     = 30 # for opensuse */
  /* } */
  /**/
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
  /**/
  /* post-processor "shell-local" { */
  /*   only = ["qemu.base"] */
  /*   inline = [ */
  /*     "source='${local.output_directory}/packer-linux_base_image'", */
  /*     "mv $source images/${local.full_name}-${var.target}-${var.firmware}.qcow2", */
  /*     "rm -rf ${local.output_directory}" */
  /*   ] */
  /* } */
  /**/
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
