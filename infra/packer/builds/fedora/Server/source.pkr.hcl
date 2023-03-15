# ISO Image
# Use `qemu-system-x86_64 -cpu help` to discover supported options by your host.

source "qemu" "fedora_base_image" {
  vm_name    = "${var.vm_guest_os_name}-${var.vm_guest_os_version}.${var.qemu_format}"
  cpus       = var.vm_cpus
  cpu_model  = "host"
  memory     = var.vm_mem_size
  net_device = var.qemu_net_device
  // disk_cache             = "none"
  // disk_compression       = true
  disk_interface = var.qemu_disk_interface
  disk_size      = var.vm_disk_size
  disk_discard   = "unmap"
  /* disk_additional_size = ["5G", "5G"] */
  disk_detect_zeroes = "unmap"
  vga                = "virtio"
  /* display              = "sdl,gl=on" */
  format      = var.qemu_format
  headless    = var.qemu_headless
  accelerator = var.qemu_accelerator
  qemu_binary = "/usr/bin/qemu-system-x86_64"
  qemuargs    = var.qemuargs
  use_pflash  = true
  /* cdrom_interface = "virtio-scsi" */
  /* firmware        = var.vm_firmware_path[var.vm_firmware] */
  firmware        = "/usr/share/edk2/ovmf/OVMF_CODE.fd"
  iso_checksum    = var.iso_checksum
  iso_urls        = local.iso_urls
  iso_target_path = local.iso_target_path
  http_content    = var.common_data_source == "http" ? local.kickstart_content : null
  http_port_min   = var.common_data_source == "http" ? var.common_http_port_min : null
  http_port_max   = var.common_data_source == "http" ? var.common_http_port_max : null
  boot_wait       = var.vm_boot_wait
  /* boot_command    = [local.boot_command[var.vm_firmware]] */
  boot_command = [
    "<up><wait>",
    "e<wait>",
    "<down><down><end><wait> ",
    "text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
    "<leftCtrlOn>x<leftCtrlOff>"
  ]
  ssh_username = var.ssh_username
  /* ssh_password = var.ssh_password */
	ssh_private_key_file = "~/.ssh/id_ecdsa_packer"
  ssh_timeout  = var.ssh_timeout
  // ssh_wait_timeout       = var.ssh_wait_timeout
  // ssh_handshake_attempts = "500"   # required for ubuntu 20.04
  // ssh_pty                = "false" # required for ansible to work
  shutdown_command = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout = var.common_shutdown_timeout
  output_directory = "${var.output_directory}/${local.dist_name}-${var.target}"
}

# Qcow2 Image
source "qemu" "fedora_hbi" {
  vm_name     = "fedora-hbi.${var.qemu_format}"
  cpus        = var.vm_cpus
  cpu_model   = "host"
  memory      = var.vm_mem_size
  accelerator = var.qemu_accelerator
  boot_wait   = "10s"
  /* boot_command = [ */
  /*   "<up><wait>", */
  /*   "e<wait>", */
  /*   "<down><down><end><wait> ", */
  /*   "vmlinuz initrd=initrd.img ", */
  /*   "quiet inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg", */
  /*   "<leftCtrlOn>x<leftCtrlOff>" */
  /* ] */
  disk_size              = var.disk_size
  disk_cache             = "none"
  disk_compression       = true
  disk_discard           = "unmap"
  disk_interface         = "virtio"
  disk_image             = true
  use_backing_file       = false
  format                 = "qcow2"
  iso_checksum           = "none"
  iso_url                = "${var.output_directory}/${local.dist_name}-${var.target}.qcow2"
  headless               = var.headless
  http_content           = var.common_data_source == "http" ? local.kickstart_content : null
  http_port_min          = var.common_data_source == "http" ? var.common_http_port_min : null
  http_port_max          = var.common_data_source == "http" ? var.common_http_port_max : null
  net_device             = "virtio-net"
  ssh_password           = var.ssh_password
  ssh_username           = var.ssh_username
  ssh_timeout            = "30m"
  ssh_wait_timeout       = "30m"
  ssh_handshake_attempts = "500"
  ssh_pty                = "false"
  qemu_binary            = "/usr/bin/qemu-system-x86_64"
  qemuargs               = var.qemuargs
  /* qemuargs = [ */
  /*   ["-serial", "file:serial.log"], */
  /* ] */
  /* firmware         = var.firmware_path[var.firmware] */
  firmware         = "/usr/share/edk2/ovmf/OVMF_CODE.fd"
  shutdown_command = "echo '${var.ssh_password}' | sudo -S shutdown -P now"
  output_directory = "${var.destination_dir}/qemu/${local.dist_name}-${var.target}"
}
