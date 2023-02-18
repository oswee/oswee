source "qemu" "fedora37" {
  // Virtual Machine Settings
  vm_name              = "${var.vm_guest_os_name}-${var.vm_guest_os_version}"
  cpus                 = var.vm_cpus
  memory               = var.vm_mem_size
  disk_size            = var.vm_disk_size
  format               = var.qemu_format
  accelerator          = var.qemu_accelerator
  net_device           = var.qemu_net_device
  disk_interface       = var.qemu_disk_interface

  // Media Settings
  iso_url      = var.iso_url
  iso_checksum = var.iso_checksum
  http_content = var.common_data_source == "http" ? local.data_source_content : null

  // Boot and Provisioning Settings
  http_port_min = var.common_data_source == "http" ? var.common_http_port_min : null
  http_port_max = var.common_data_source == "http" ? var.common_http_port_max : null
  boot_wait     = var.vm_boot_wait
  boot_command = [
    "<up>",
    "e",
    "<down><down><end><wait>",
    "text ${local.data_source_command}",
    "<enter><wait><leftCtrlOn>x<leftCtrlOff>"
  ]
  shutdown_command = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout = var.common_shutdown_timeout

  // Communicator Settings and Credentials
  ssh_username         = var.build_username
  ssh_password         = var.build_password
  ssh_timeout          = var.communicator_timeout
}
