build {
  name        = "Fedora"
  description = "Fedora"
  sources     = ["source.qemu.fedora"]

  /* provisioner "ansible" { */
  /*   playbook_file = "playbooks/site.yml" */
  /* } */

  post-processors {
    post-processor "vagrant" {
      name                           = "box"
      include                        = ["packer/fedora/info.json"]
      vagrantfile_template_generated = true
      output                         = "packer/output/boxes/{{.BuildName}}${var.version}_{{.Provider}}.box"
      keep_input_artifact            = true
    }
    post-processor "checksum" {
      name           = "sha256"
      checksum_types = ["sha256"]
      output         = "packer/output/boxes/{{.BuildName}}${var.version}.checksum"
    }
    post-processor "manifest" {
      strip_path = true
    }
  }
}
