packer {
  required_version = ">= 1.7.9"
  required_plugins {
    qemu = {
      version = ">= v1.0.1"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

