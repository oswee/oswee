#!/bin/sh

# Format this script when executing
shfmt -i 2 -w $0

tfinit() {
  terraform -chdir=$1 init -upgrade \
    -backend-config "bucket=$TF_VAR_s3_bucket" \
    -backend-config "access_key=$TF_VAR_access_key" \
    -backend-config "secret_key=$TF_VAR_secret_key" \
    -backend-config "endpoint=$TF_VAR_endpoint"
}

tfplan() {
  terraform -chdir=$1 plan
}

tfapply() {
  terraform -chdir=$1 apply
}

tfdestroy() {
  terraform -chdir=$1 destroy
}

tflint() {
  tflint --enable-rule=terraform_unused_declarations $1
}

environment="./project/ignite/$1"
case $2 in
init)
  tfinit $environment
  ;;
plan)
  tfplan $environment
  ;;
apply)
  tfapply $environment
  ;;
destroy)
  tfdestroy $environment
  break
  ;;
*)
  echo "No subcommand provided"
  ;;
esac
