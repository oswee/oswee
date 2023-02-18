locals {
  buildtime     = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  manifest_date = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path = "${path.cwd}/manifests/"
  data_source_content = {
    "/ks.cfg" = templatefile("${abspath(path.root)}/data/ks.pkrtpl.hcl", {
      build_username           = var.build_username
      build_password_encrypted = var.build_password_encrypted
      vm_guest_os_language     = var.vm_guest_os_language
      vm_guest_os_keyboard     = var.vm_guest_os_keyboard
      vm_guest_os_timezone     = var.vm_guest_os_timezone
    })
  }
  data_source_command = var.common_data_source == "http" ? "inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg" : "inst.ks=cdrom:/ks.cfg"
}
