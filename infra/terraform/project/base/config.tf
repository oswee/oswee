terraform {
  required_version = ">= 1.3.1"

  backend "local" {
    path = "/mnt/data/terraform/project/base/terraform.tfstate"
  }
}
