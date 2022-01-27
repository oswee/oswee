terraform {
  required_version = ">= 0.14.7"
  experiments      = [module_variable_optional_attrs]

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~>0.6.3"
    }
  }
}

