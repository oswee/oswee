/*
    DESCRIPTION:
    QEMU variables used for all builds.
    - Variables are use by the source blocks.
*/

// QEMU Settings"
qemu_machine_type      = "q35"
qemu_format            = "qcow2"
qemu_accelerator       = "kvm"
qemu_net_device        = "virtio-net"
qemu_disk_interface    = "virtio"
qemu_disk_cache        = "unsafe"
qemu_disk_discard      = "unmap"
qemu_headless          = false