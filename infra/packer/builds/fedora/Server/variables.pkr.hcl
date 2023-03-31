variable "answer_file" {
  type        = string
  default     = "kickstart.cfg"
  description = "The name of the answer file to use for installation."
}

/* variable "version_minor" { */
/*   type        = string */
/*   description = "Minor version number of the OS." */
/* } */

variable "vg_name" {
  type        = string
  default     = "vgdata"
  description = "LVM volume group name to use for the installation."
}

variable "vm_guest_os_language" {
  type        = string
  description = "The guest operating system language."
  default     = "en_US"
}

variable "vm_guest_os_keyboard" {
  type        = string
  description = "The guest operating system keyboard input."
  default     = "us"
}

variable "vm_guest_os_timezone" {
  type        = string
  description = "The guest operating system timezone."
  default     = "UTC"
}

variable "vm_guest_os_name" {
  type        = string
  description = "The guest operating system family. Used for naming. (e.g.'fedora')"
}

variable "vm_guest_os_version" {
  type        = string
  description = "The guest operating system version. Used for naming. (e.g. '35')"
}

variable "vm_cpus" {
  type        = number
  description = "The number of virtual CPUs. (e.g. '1')"
}

variable "vm_mem_size" {
  type        = number
  description = "The size for the virtual memory in MB. (e.g. '2048')"
}

variable "vm_disk_size" {
  type        = number
  description = "The size for the virtual disk in MB. (e.g. '40960')"
}

/* variable "qemu_machine_type" { */
/*   type        = string */
/*   description = "The type of machine emulation to use." */
/*   default     = "q35" */
/* } */

variable "qemu_format" {
  type        = string
  description = "The output format of the virtual machine image."
  default     = "qcow2"
}

variable "qemu_accelerator" {
  type        = string
  description = "The accelerator type to use when running the VM."
  default     = "kvm"
}

variable "qemu_net_device" {
  type        = string
  description = "The driver to use for the network interface."
  default     = "virtio-net"
}

variable "qemu_disk_interface" {
  type        = string
  description = "The interface to use for the disk."
  default     = "virtio"
}

/* variable "qemu_disk_cache" { */
/*   type        = string */
/*   description = "The cache mode to use for disk." */
/*   default     = "unsafe" */
/* } */
/**/
/* variable "qemu_disk_discard" { */
/*   type        = string */
/*   description = "The discard mode to use for disk." */
/*   default     = "unmap" */
/* } */

variable "qemu_headless" {
  type        = bool
  description = "If the GUI of the guest will show during the build."
  default     = false
}

/* variable "iso_url" { */
/*   type        = string */
/*   description = "A URL to the ISO containing the installation image." */
/* } */

variable "iso_checksum" {
  type        = string
  description = "The checksum for the ISO file or virtual hard drive file."
}

variable "iso_base_dir" {
  type        = string
  default     = "/tmp"
  description = "Directory where the ISO files are located."
}

variable "iso_file" {
  type        = string
  description = "Base name of ISO file."
}

variable "iso_base_url" {
  type        = string
  description = "Download URL of ISO without 'var.iso_file'."
}

variable "target" {
  type        = string
  description = "Template to use for disk-layout and other domain specific options."
}

variable "output_directory" {
  type        = string
  description = "Directory where to store built disk images."
}

variable "http_directory" {
  default     = "http"
  description = "Directory of packer provided content."
}

variable "common_data_source" {
  type        = string
  description = "The provisioning data source ('http' or 'disk')."
}

/* variable "common_http_ip" { */
/*   type        = string */
/*   description = "Define an IP address on the host to use for the HTTP server." */
/*   default     = null */
/* } */

variable "common_http_port_min" {
  type        = number
  description = "The start of the HTTP port range."
}

variable "common_http_port_max" {
  type        = number
  description = "The end of the HTTP port range."
}

variable "vm_boot_wait" {
  type        = string
  description = "The time to wait before boot."
}

/* variable "common_ip_wait_timeout" { */
/*   type        = string */
/*   description = "Time to wait for guest operating system IP address response." */
/* } */

variable "common_shutdown_timeout" {
  type        = string
  description = "Time to wait for guest operating system shutdown."
}

variable "vm_firmware" {
  type        = string
  default     = "bios"
  description = "The boot method is either 'bios' (default) or 'efi'."

  validation {
    condition     = contains(["bios", "uefi"], var.vm_firmware)
    error_message = "The vm_firmware value must be one of the following: 'bios', 'uefi'."
  }
}

variable "vm_firmware_path" {
  type = object({
    bios = string
    uefi = string
  })
  description = "Path to firmware blob."
  default = {
    bios = ""
    /* uefi       = "/usr/share/qemu/OVMF.fd" */
    uefi = "/usr/share/edk2/ovmf/OVMF_CODE.fd"
  }
}

variable "bios_boot_command" {
  type        = list(string)
  description = "A list of commands to be executed during BIOS ISO boot."
  default = [
    "<up><wait>",
    "e<wait>",
    "<down><down><end><wait> ",
    "text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
    "<leftCtrlOn>x<leftCtrlOff>"
  ]
}

variable "uefi_boot_command" {
  type        = list(string)
  description = "A list of commands to be executed during UEFI ISO boot."
  default = [
    "<up><wait>",
    "e<wait>",
    "<down><down><end><wait> ",
    "vmlinuz initrd=initrd.img ",
    "quiet inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
    "<leftCtrlOn>x<leftCtrlOff>"
  ]

}

variable "qemuargs" {
  type        = list(list(string))
  description = "Default qemuargs for the build"
  default     = [["-vga", "qxl"]]
}

variable "qemuargs2" {
  type        = list(list(string))
  description = "Default qemuargs for the build"
  default     = [["-vga", "qxl"]]
}

variable "build_username" {
  type        = string
  description = "The username to login to the guest operating system. (e.g. vagrant)"
  sensitive   = true
}

variable "build_password" {
  type        = string
  description = "The password to login to the guest operating system."
  sensitive   = true
}

variable "build_ssh_key" {
  type        = string
  description = "The public SSH key to login to the guest operating system."
  sensitive   = true
}

variable "build_password_encrypted" {
  type        = string
  description = "The encrypted password to login to the guest operating system."
  sensitive   = true
}

variable "ssh_username" {
  type        = string
  description = "SSH user used by provisioners."
}

variable "ssh_password" {
  type        = string
  sensitive   = true
  description = "SSH password used by provisioners."
}

variable "ssh_timeout" {
  type        = string
  description = "The timeout for the ssh protocol."
}

variable "ssh_wait_timeout" {
  type        = string
  default     = "30m"
  sensitive   = true
  description = "How long to wait until ssh gives up waiting during stage one; default is '30m'."
  validation {
    condition     = can(regex("^[0-9]+m$", var.ssh_wait_timeout))
    error_message = "The 'ssh_wait_timeout' format must be '<digit>[<digit>]m'."
  }
}

variable "volume_id" {
  type        = string
  default     = ""
  description = "The volume id of the iso file"
}

/* variable "ansible_user" { */
/*   type        = string */
/*   description = "The username used for the Ansible provisioner." */
/* } */
/**/
/* variable "scripts" { */
/*   type        = list(string) */
/*   description = "A list of scripts and their relative paths to transfer and execute." */
/*   default     = [] */
/* } */
/**/
/* variable "inline" { */
/*   type        = list(string) */
/*   description = "A list of commands to execute." */
/*   default     = [] */
/* } */
