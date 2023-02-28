// Guest Operating System Metadata
vm_guest_os_name     = "fedora"
vm_guest_os_version  = "37"
vm_guest_os_language = "en_US"
vm_guest_os_keyboard = "us"
vm_guest_os_timezone = "UTC"

// Provisioner Settings
/* scripts = [] */
/* inline  = [] */

vm_cpus           = 2
vm_mem_size       = 2048
vm_disk_size      = 4096
iso_base_dir      = "/media/registry/iso"
iso_file          = "Fedora-Server-netinst-x86_64-37-1.7.iso"
iso_base_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Server/x86_64/iso"
iso_checksum      = "sha256:149d4bae999022b07bd40f8272f6208bc28884dad5110c63e915d37458e6abc0"
target            = "server"
output_directory  = "artifacts"
http_directory    = "http"
vm_boot_wait      = "2s"
vm_firmware       = "bios"
ssh_username      = "vagrant"
ssh_password      = "vagrant"
ssh_timeout       = "30m"
/* ssh_wait_timeout  = "" */
answer_file       = ""
/* bios_boot_command = [ */
/*   "<enter><enter><f6><esc><wait>", */
/*   "<bs><bs><bs><bs>", */
/*   "autoinstall ", */
/*   "net.ifnames=0 ", */
/*   "biosdevname=0 ", */
/*   "ip=dhcp ", */
/*   "ipv6.disable=1 ", */
/*   "ds=nocloud-net;", */
/*   "s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/%s ", */
/*   "--- <enter>" */
/* ] */
efi_boot_command  = [
  "c<enter><wait>",
  "linuxefi /casper/vmlinuz ",
  "quiet ",
  "autoinstall ",
  "net.ifnames=0 ",
  "biosdevname=0 ",
  "ip=dhcp ",
  "ipv6.disable=1 ",
  "ds=nocloud-net\\;",
  "s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/%s ",
  "---- ",
  "; inst.stage2=hd:LABEL=%s ",
  "<enter><wait2>",
  "initrdefi /casper/initrd<enter><wait3>",
  "boot<enter><wait>"
]





/* disk_path       = "/dev/vda" */
/* disk_size       = "48000" */
/* headless        = "true" */
/* locale          = "en_US.UTF-8" */
/* keyboard        = "us" */
/* root_password   = "vagrant" */
/* vg_name         = "vgdata" */
/**/
/* repo_url          = "" */
/* version_minor     = "" */
/* code_name         = "kinetic" */
