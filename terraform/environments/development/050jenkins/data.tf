data "terraform_remote_state" "base" {
  backend = "local"

  config = {
    path = "../000base/.state/terraform.tfstate"
  }
}
