source "qemu" "ci_image" {
  output_directory   = "${var.output_directory}/${local.dist_name}-${var.target}"
  vm_name            = "${var.vm_name}.${var.qemu_format}"
  cpus               = var.vm_cpus
  cpu_model          = "host"
  memory             = var.vm_mem_size
  net_device         = var.qemu_net_device
  disk_cache         = "none"
  disk_compression   = true
  disk_interface     = var.qemu_disk_interface
  disk_size          = var.vm_disk_size
  disk_discard       = "unmap"
  disk_image         = true
  use_backing_file   = false
  disk_detect_zeroes = "unmap"
  vga                = "virtio"
  format             = var.qemu_format
  headless           = var.qemu_headless
  accelerator        = var.qemu_accelerator
  qemu_binary        = "/usr/bin/qemu-system-x86_64"
  /* qemuargs           = var.qemuargs */
  qemuargs = [
    ["-boot", "menu=on,strict=on"],
    ["-drive", "if=pflash,format=raw,readonly=on,unit=0,file=/usr/share/edk2/ovmf/OVMF_CODE.fd"],
    ["-drive", "file=${var.qemu_registry_path}/artifacts/${local.dist_name}-${var.target}/${var.common_base_image_name}.qcow2,if=virtio,cache=none,format=qcow2,discard=on"],
  ]
  use_pflash   = true
  firmware     = "/usr/share/edk2/ovmf/OVMF_CODE.fd"
  iso_checksum = "file:${var.qemu_registry_path}/artifacts/${local.dist_name}-${var.target}/${var.common_base_image_name}.md5"
  iso_url      = "${var.qemu_registry_path}/artifacts/${local.dist_name}-${var.target}/${var.common_base_image_name}.qcow2"
  /* boot_command = [ */
  /*   "<up><wait>", */
  /*   "e<wait>", */
  /*   "<down><down><end><wait> ", */
  /*   "<leftCtrlOn>x<leftCtrlOff>" */
  /* ] */
  ssh_username         = var.ssh_username
  ssh_private_key_file = "~/.ssh/id_ed25519-packer"
  ssh_timeout          = var.ssh_timeout
  shutdown_command     = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout     = var.common_shutdown_timeout
}
