data "terraform_remote_state" "base" {
  backend = "local"

  config = {
    path = "/mnt/data/terraform/development/000base/terraform.tfstate"
  }
}
