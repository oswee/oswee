/*
    DESCRIPTION:
    Fedora 35 variables used by Packer.
*/

// Guest Operating System Metadata
vm_guest_os_language = "en_US"
vm_guest_os_keyboard = "us"
vm_guest_os_timezone = "UTC"
vm_guest_os_name     = "fedora"
vm_guest_os_version  = "35"

// Virtual Machine Hardware Settings
vm_cpus                  = 1
vm_mem_size              = 2048
vm_disk_size             = 5120

// Media Settings
iso_url       = "https://dl.fedoraproject.org/pub/fedora/linux/releases/35/Server/x86_64/iso/Fedora-Server-netinst-x86_64-35-1.2.iso"
iso_checksum  = "dd35f955dd5a7054213a0098c6ee737ff116aa3090fc6dbfe89d424b5c3552dd"

// Boot Settings
vm_boot_wait  = "2s"

// Communicator Settings
communicator_timeout = "30m"

// Provisioner Settings
scripts = ["scripts/init_redhat.sh"]
inline  = []
