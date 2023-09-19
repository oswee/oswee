// Guest Operating System Metadata
vm_guest_os_name     = "fedora"
vm_guest_os_version  = "37"
vm_guest_os_language = "en_US"
vm_guest_os_keyboard = "us"
vm_guest_os_timezone = "Europe/Riga"

// Provisioner Settings
scripts = ["scripts/test.sh"]
// inline  = []

vm_name           = "base-image"
vm_cpus           = 2
vm_mem_size       = 2048
vm_disk_size      = 20480
iso_base_dir      = "/mnt/data/registry/iso"
iso_file          = "Fedora-Server-netinst-x86_64-37-1.7.iso"
iso_base_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Server/x86_64/iso"
iso_checksum      = "sha256:149d4bae999022b07bd40f8272f6208bc28884dad5110c63e915d37458e6abc0"
target            = "server"
output_directory  = "/tmp/packer"
http_directory    = "http"
vm_boot_wait      = "10s"
vm_firmware       = "/usr/share/edk2/ovmf/OVMF_CODE.fd"
ssh_username      = "vagrant"
ssh_password      = "vagrant"
ssh_timeout       = "30m"
/* ssh_wait_timeout  = "" */
answer_file       = ""
boot_command = [
  "<up><wait>",
  "e<wait>",
  "<down><down><end><wait> ",
  "text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
  "<leftCtrlOn>x<leftCtrlOff>"
]

qemuargs = [
	["-boot", "menu=on,strict=on"],

  /* [ "-drive", "if=pflash,format=raw,readonly=on,unit=0,file=/usr/share/edk2/ovmf/OVMF_CODE.fd" ], */

  /* [ "-drive", "if=none,media=cdrom,id=cdrom0,file=/mnt/data/registry/iso/fedora-37/Fedora-Server-netinst-x86_64-37-1.7.iso" ], */
  /* [ "-device", "virtio-scsi-pci,id=scsi1" ], */
  /* [ "-device", "scsi-cd,bus=scsi1.0,drive=cdrom0,bootindex=0" ], # Set the boot index to the cdrom, otherwise UEFI wont boot from CD */
]
