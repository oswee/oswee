terraform {
  required_version = ">= 1.3.1"

  required_providers {
    vault = ">= 3.9.1"
  }
  backend "s3" {
    key                         = "04-vault/terraform.tfstate"
    region                      = "eu1"
    skip_credentials_validation = true
    skip_region_validation      = true
    force_path_style            = true
    encrypt                     = "true"
    lock_table                  = "terraform"
  }
}

provider "vault" {
  address = var.vault.address
}
