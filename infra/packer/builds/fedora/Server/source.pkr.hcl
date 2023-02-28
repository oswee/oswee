// ISO Image
source "qemu" "fedora_base_image" {
  vm_name                = "${var.vm_guest_os_name}-${var.vm_guest_os_version}.${var.qemu_format}"
  cpus                   = var.vm_cpus
  memory                 = var.vm_mem_size
  net_device             = var.qemu_net_device
  disk_cache             = "none"
  disk_compression       = true
  disk_discard           = "unmap"
  disk_interface         = var.qemu_disk_interface
  disk_size              = var.vm_disk_size
  format                 = var.qemu_format
  headless               = var.qemu_headless

  accelerator            = var.qemu_accelerator
  qemu_binary            = "/usr/bin/qemu-system-x86_64"
  /* qemuargs               = var.qemuargs */
  /* firmware               = var.vm_firmware_path[var.vm_firmware] */

  iso_checksum           = var.iso_checksum
  iso_urls               = local.iso_urls
  iso_target_path        = local.iso_target_path
  /* http_directory         = var.http_directory */
  http_content           = var.common_data_source == "http" ? local.kickstart_content : null
  http_port_min          = var.common_data_source == "http" ? var.common_http_port_min : null
  http_port_max          = var.common_data_source == "http" ? var.common_http_port_max : null
  boot_wait              = var.vm_boot_wait
  /* boot_command           = [local.boot_command[var.vm_firmware]] */
	boot_command = [
  	"<up>",
  	"e",
  	"<down><down><end><wait>",
  	"text ${local.kickstart_command}",
  	"<enter><wait><leftCtrlOn>x<leftCtrlOff>"
	]

  ssh_password           = var.ssh_password
  ssh_username           = var.ssh_username
  ssh_timeout            = var.ssh_timeout
  /* ssh_wait_timeout       = var.ssh_wait_timeout */
  /* ssh_handshake_attempts = "500"   # required for ubuntu 20.04 */
  /* ssh_pty                = "false" # required for ansible to work */
  shutdown_command       = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout       = var.common_shutdown_timeout
  /* output_directory       = "${var.output_directory}/qemu/${local.dist_name}-${var.target}" */
  output_directory       = "/media/registry/qemu/artifacts/${local.dist_name}-${var.target}"
}

// Qcow2 Image
/* source "qemu" "fedora_hbi" { */
/*   cpus                   = var.cpu */
/*   memory                 = var.ram */
/*   accelerator            = var.accelerator */
/*   boot_wait              = "3s" */
/*   disk_size              = var.disk_size */
/*   disk_image             = true */
/*   disk_cache             = "none" */
/*   disk_compression       = true */
/*   disk_discard           = "unmap" */
/*   disk_interface         = "virtio" */
/*   use_backing_file       = false */
/*   format                 = "qcow2" */
/*   iso_checksum           = "none" */
/*   iso_url                = "images/${local.full_name}-${var.target}-${var.firmware}.qcow2" */
/*   headless               = var.headless */
/*   http_directory         = var.http_dir */
/*   net_device             = "virtio-net" */
/*   output_directory       = "${var.destination_dir}/qemu/${local.dist_name}-${var.target}" */
/*   shutdown_command       = "echo '${var.ssh_password}' | sudo -S shutdown -P now" */
/*   ssh_password           = var.ssh_password */
/*   ssh_username           = var.ssh_username */
/*   ssh_timeout            = "30m" */
/*   ssh_wait_timeout       = "30m" */
/*   ssh_handshake_attempts = "500"   # required for ubuntu 20.04 */
/*   ssh_pty                = "false" # required for ansible to work */
/*   qemu_binary            = "/usr/bin/qemu-system-x86_64" */
/*   qemuargs               = var.qemuargs */
/*   firmware               = var.firmware_path[var.firmware] */
/* } */
