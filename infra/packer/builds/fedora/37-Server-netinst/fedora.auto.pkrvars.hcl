/*
    DESCRIPTION:
    Fedora 37 variables used by Packer.
*/

// Guest Operating System Metadata
vm_guest_os_language = "en_US"
vm_guest_os_keyboard = "us"
vm_guest_os_timezone = "UTC"
vm_guest_os_name     = "fedora"
vm_guest_os_version  = "37"

// Virtual Machine Hardware Settings
vm_cpus                  = 1
vm_mem_size              = 2048
vm_disk_size             = 5120

// Media Settings
iso_url       = "https://dl.fedoraproject.org/pub/fedora/linux/releases/37/Server/x86_64/iso/Fedora-Server-netinst-x86_64-37-1.7.iso"
iso_checksum  = "149d4bae999022b07bd40f8272f6208bc28884dad5110c63e915d37458e6abc0"

// Boot Settings
vm_boot_wait  = "2s"

// Communicator Settings
communicator_timeout = "30m"

// Provisioner Settings
scripts = ["scripts/init_redhat.sh"]
inline  = []
