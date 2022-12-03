terraform {
  required_version = ">= 1.3.1"
  required_providers {
    vault = ">= 3.9.1"
    buildkite = {
      source  = "buildkite/buildkite"
      version = "0.11.0"
    }
  }
  backend "s3" {
    key                         = "build/terraform.tfstate"
    region                      = "eu1"
    skip_credentials_validation = true
    skip_region_validation      = true
    force_path_style            = true
    encrypt                     = "true"
    lock_table                  = "terraform"
  }
}

provider "vault" {
  # address = var.vault_addr
}

# TODO: Make sure those secrets are there before running this
provider "buildkite" {
  api_token    = data.vault_generic_secret.buildkite.data["api_token"]
  organization = data.vault_generic_secret.buildkite.data["organization"]
}
