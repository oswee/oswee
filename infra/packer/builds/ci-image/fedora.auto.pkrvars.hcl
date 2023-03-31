// Guest Operating System Metadata
vm_guest_os_name     = "fedora"
vm_guest_os_version  = "37"
vm_guest_os_language = "en_US"
vm_guest_os_keyboard = "us"
vm_guest_os_timezone = "Europe/Riga"

// Provisioner Settings
/* scripts = [] */
/* inline  = [] */

vm_name           = "ci-image"
vm_cpus           = 2
vm_mem_size       = 2048
vm_disk_size      = 20480
iso_base_dir      = "/media/registry/iso"
iso_file          = "Fedora-Server-netinst-x86_64-37-1.7.iso"
iso_base_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Server/x86_64/iso"
iso_checksum      = "sha256:149d4bae999022b07bd40f8272f6208bc28884dad5110c63e915d37458e6abc0"
target            = "server"
output_directory  = "/tmp/packer"
http_directory    = "http"
vm_boot_wait      = "10s"
vm_firmware       = "uefi"
ssh_username      = "vagrant"
ssh_password      = "vagrant"
ssh_timeout       = "30m"
/* ssh_wait_timeout  = "" */
answer_file       = ""
bios_boot_command = [
  "<up><wait>",
  "e<wait>",
  "<down><down><end><wait> ",
  "<leftCtrlOn>x<leftCtrlOff>"
]


qemuargs = [
	["-boot", "menu=on,strict=on"],

  [ "-drive", "if=pflash,format=raw,readonly=on,unit=0,file=/usr/share/edk2/ovmf/OVMF_CODE.fd" ],
  [ "-drive", "if=pflash,format=raw,readonly=on,unit=1,file=/usr/share/edk2/ovmf/OVMF_VARS.fd" ],
]

