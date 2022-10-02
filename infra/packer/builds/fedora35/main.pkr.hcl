packer {
  required_version = ">= 1.8.0"
  required_plugins {
    qemu = {
      version = ">= v1.0.2"
      source  = "github.com/hashicorp/qemu"
    }
  }
}
