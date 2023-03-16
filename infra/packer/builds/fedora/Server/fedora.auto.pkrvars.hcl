// Guest Operating System Metadata
vm_guest_os_name     = "fedora"
vm_guest_os_version  = "37"
vm_guest_os_language = "en_US"
vm_guest_os_keyboard = "us"
vm_guest_os_timezone = "Europe/Riga"

// Provisioner Settings
/* scripts = [] */
/* inline  = [] */

vm_cpus           = 2
vm_mem_size       = 2048
vm_disk_size      = 20480
iso_base_dir      = "/media/registry/iso"
iso_file          = "Fedora-Server-netinst-x86_64-37-1.7.iso"
iso_base_url      = "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Server/x86_64/iso"
iso_checksum      = "sha256:149d4bae999022b07bd40f8272f6208bc28884dad5110c63e915d37458e6abc0"
target            = "server"
output_directory  = "/media/registry/qemu/artifacts"
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
  "text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
  "<leftCtrlOn>x<leftCtrlOff>"
]
efi_boot_command  = [
	"<up><wait>",
	"e<wait>",
  "<down><down><end><wait> ",
  "vmlinuz initrd=initrd.img ",
	"quiet inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
  "<leftCtrlOn>x<leftCtrlOff>"
]

qemuargs2 = [
  /* [ "-m", "1024m" ], */
  /* [ "-smp", "2" ], */
  /* [ "-vga", "virtio" ], */
	/* ["-bios", var.ovmf_path], */
	/* ["-global", "driver=cfi.pflash01,property=secure,value=on"], */
	/* ["-serial", "file:packer.log"], */
  /* ["-append", "console=ttyS0"], */
	["-boot", "menu=on,strict=on"], # Override the default packer -boot flag which is not valid on UEFI
/* ["-boot", "order=c,once=d,menu=on,strict=on"] */

  // first should go drive and then device

  [ "-drive", "if=pflash,format=raw,readonly=on,unit=0,file=/usr/share/edk2/ovmf/OVMF_CODE.fd" ],
  [ "-drive", "if=pflash,format=raw,readonly=on,unit=1,file=/usr/share/edk2/ovmf/OVMF_VARS.fd" ],

	// qemu-img create -f qcow2 /media/registry/qemu/kingston.qcow 20G
	/* [ "-drive", "id=drive0,file=/media/registry/qemu/kingston.qcow,format=qcow2,if=none,index=3" ], */
	/* [ "-device", "virtio-scsi-pci,id=scsi0" ], */
	/* [ "-device", "scsi-hd,bus=scsi0.0,drive=drive0,vendor='KINGSTON',product='SH103S3240G',serial='50026B724B04A931',ver='2.6',rotation_rate=1" ], */

  [ "-drive", "if=none,media=cdrom,id=cdrom0,file=/media/registry/iso/fedora-37/Fedora-Server-netinst-x86_64-37-1.7.iso" ],
  [ "-device", "virtio-scsi-pci,id=scsi1" ],
  [ "-device", "scsi-cd,bus=scsi1.0,drive=cdrom0,bootindex=0" ], # Set the boot index to the cdrom, otherwise UEFI wont boot from CD
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
