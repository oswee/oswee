terraform {
  required_version = ">= 1.3.1"
  backend "s3" {
    key                         = "01-network/terraform.tfstate"
    region                      = "eu1"
    skip_credentials_validation = true
    skip_region_validation      = true
    force_path_style            = true
    encrypt                     = "true"
    lock_table                  = "terraform"
  }
}
