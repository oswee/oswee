terraform {
  required_version = ">= 1.3.1"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.7.0"
    }
  }
}

provider "libvirt" {
  uri = var.provider_libvirt_uri
}

terraform {
  backend "local" {
    path = "/mnt/data/terraform/development/000-base/terraform.tfstate"
  }
}

# terraform {
#   backend "s3" {
#     endpoint                    = "https://s3.oswee.com"
#     bucket                      = "terraform"
#     key                         = "dev/terraform.tfstate"
#     region                      = "eu-north-1"
#     skip_requesting_account_id  = true
#     skip_credentials_validation = true
#     skip_get_ec2_platforms      = true
#     skip_metadata_api_check     = true
#     skip_region_validation      = true
#     force_path_style            = true
#   }
# }
