packer {
  required_version = ">= 1.8.6"
  required_plugins {
    qemu = {
      version = ">= v1.0.9"
      source  = "github.com/hashicorp/qemu"
    }
  }
}
