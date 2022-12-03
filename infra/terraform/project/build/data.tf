data "terraform_remote_state" "storage" {
  backend = "s3"

  config = {
    bucket                      = var.s3_bucket
    access_key                  = var.access_key
    secret_key                  = var.secret_key
    endpoint                    = var.endpoint
    key                         = "00-storage/terraform.tfstate"
    region                      = "eu1"
    skip_credentials_validation = true
    skip_region_validation      = true
    force_path_style            = true
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket                      = var.s3_bucket
    access_key                  = var.access_key
    secret_key                  = var.secret_key
    endpoint                    = var.endpoint
    key                         = "01-network/terraform.tfstate"
    region                      = "eu1"
    skip_credentials_validation = true
    skip_region_validation      = true
    force_path_style            = true
  }
}

data "terraform_remote_state" "dns" {
  backend = "s3"

  config = {
    bucket                      = var.s3_bucket
    access_key                  = var.access_key
    secret_key                  = var.secret_key
    endpoint                    = var.endpoint
    key                         = "02-dns/terraform.tfstate"
    region                      = "eu1"
    skip_credentials_validation = true
    skip_region_validation      = true
    force_path_style            = true
  }
}

data "vault_generic_secret" "buildkite" {
  path = "infra/buildkite"
}

data "local_file" "release_step" {
  filename = "${path.module}/steps/release.yaml"
}
