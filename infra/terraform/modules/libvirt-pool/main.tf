resource "libvirt_pool" "pool" {
  name = var.name
  type = var.type
  path = var.path
}

