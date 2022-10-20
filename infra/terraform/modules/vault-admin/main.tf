terraform {
  required_version = ">= 1.3.1"

  required_providers {
    vault = ">= 3.9.1"
  }
}

provider "vault" {
  address = var.vault_addr
}
