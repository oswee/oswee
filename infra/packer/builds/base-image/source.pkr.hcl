source "qemu" "base_image" {
  output_directory     = "${var.output_directory}/${local.dist_name}-${var.target}"
  vm_name              = "${var.common_base_image_name}.${var.qemu_format}"
  cpus                 = var.vm_cpus
  cpu_model            = "host"
  memory               = var.vm_mem_size
  net_device           = var.qemu_net_device
  disk_interface       = var.qemu_disk_interface
  disk_size            = var.vm_disk_size
  disk_discard         = "unmap"
  /* disk_detect_zeroes   = "unmap" */
  vga                  = "virtio"
  qemu_binary          = var.qemu_binary
  machine_type         = var.qemu_machine_type
  format               = var.qemu_format
  headless             = var.qemu_headless
  accelerator          = var.qemu_accelerator
  use_pflash           = false
  firmware             = var.vm_firmware
  qemuargs             = var.qemuargs
  iso_checksum         = var.iso_checksum
  iso_urls             = local.iso_urls
  iso_target_path      = local.iso_target_path
  http_content         = var.common_data_source == "http" ? local.kickstart_content : null
  http_port_min        = var.common_data_source == "http" ? var.common_http_port_min : null
  http_port_max        = var.common_data_source == "http" ? var.common_http_port_max : null
  boot_wait            = var.vm_boot_wait
  boot_command         = var.boot_command
  ssh_username         = var.ssh_username
  ssh_private_key_file = "~/.ssh/id_ecdsa_packer"
  ssh_timeout          = var.ssh_timeout
  // ssh_wait_timeout       = var.ssh_wait_timeout
  // ssh_handshake_attempts = "500"   # required for ubuntu 20.04
  // ssh_pty                = "false" # required for ansible to work
  shutdown_command = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout = var.common_shutdown_timeout
}
