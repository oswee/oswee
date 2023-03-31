locals {
  /* buildtime     = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp()) */
  /* manifest_date = formatdate("YYYY-MM-DD hh:mm:ss", timestamp()) */
  /* manifest_path = "${path.cwd}/manifests/" */
  ansible_dir = "../ansible"
  dist_name   = "${var.vm_guest_os_name}-${var.vm_guest_os_version}"

  config_file = "${local.dist_name}/${var.answer_file}"

  /* volume_id = replace(var.volume_id, " ", "\\x20") */
  /* boot_command = { */
  /*   "bios" = format(join("", var.bios_boot_command), local.config_file), */
  /*   "uefi" = format(join("", var.uefi_boot_command), local.config_file, local.volume_id) */
  /* } */
  iso_dir         = "${var.iso_base_dir}/${local.dist_name}"
  iso_target_path = "${local.iso_dir}/${var.iso_file}"
}
