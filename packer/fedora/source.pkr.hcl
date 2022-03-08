source "qemu" "fedora" {
  headless           = "${var.headless}"
  accelerator        = "kvm"
  qmp_enable         = true
  qemuargs           = [
    ["-chardev", "socket,id=serial0,path={{ .OutputDir }}/{{ .Name }}.console,server,nowait"],
    ["-serial",  "chardev:serial0"],
    ["-spice",   "unix,addr={{ .OutputDir }}/{{ .Name }}.spice,disable-ticketing"],
    ["-device",  "virtio-serial"],
    ["-chardev", "spicevmc,id=vdagent,debug=0,name=vdagent"],
    ["-device",  "virtserialport,chardev=vdagent,name=com.redhat.spice.0"],
  ]
  vnc_use_password   = true
  iso_url            = "${local.iso_url}"
  iso_checksum       = "${local.iso_checksum}"
  output_directory   = "output/{{build_type}}"
  ssh_timeout        = "60000s"
  ssh_wait_timeout   = "60000s"
  ssh_username       = "vagrant"
  ssh_password       = "${var.password}"
  /* ssh_private_key_file = "/home/dzintars/.ssh/id_ecdsa_packer" */
  vm_name            = "fedora${var.version}"
  cpus               = "2"
  memory             = "1024"
  disk_compression   = true
  disk_detect_zeroes = "unmap"
  disk_discard       = "unmap"
  disk_size          = "10240M"
  http_directory     = "./packer/fedora/http/"
  boot_key_interval  = "10ms"
  boot_wait          = "1s"
  boot_command       = ["<tab> console=ttyS0,115200n8 inst.text inst.sshd ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"]
  // shutdown_command   = "echo '${var.password}' | sudo -S shutdown -P now"
}
