terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    key                         = "03-vault/terraform.tfstate"
    region                      = "eu1"
    skip_credentials_validation = true
    skip_region_validation      = true
    force_path_style            = true
    encrypt                     = "true"
    lock_table                  = "terraform"
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
