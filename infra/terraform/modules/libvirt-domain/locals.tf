resource "random_pet" "instance" {}
resource "random_uuid" "instance" {}
resource "macaddress" "mac" {}

locals {
  volume = defaults(var.volume, {
    name   = random_pet.instance.id
    source = "https://download.fedoraproject.org/pub/fedora/linux/releases/36/Cloud/x86_64/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2"
    format = "qcow2"
    pool   = "/var/lib/libvirt/pools"
  })

  network = defaults(var.network, {
    id             = random_uuid.instance.id
    mac            = macaddress.mac.address
    wait_for_lease = false
  })

  cloudinit = defaults(var.cloudinit, {
    name           = random_pet.instance.id
    dhcp           = true
    interface_name = "eth0"
  })

  vm = defaults(var.vm, {
    user             = "terraform"
    user_ssh_pub_key = ""
    hostname         = random_pet.instance.id
    domain           = "example.local"
    time_zone        = "UTC"
  })

  domain = defaults(var.domain, {
    name   = random_pet.instance.id
    memory = "1024"
    vcpu   = "1"
    arch   = "x86_64"
  })
}
