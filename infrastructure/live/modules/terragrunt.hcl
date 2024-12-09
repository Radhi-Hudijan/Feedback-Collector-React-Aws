# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=5.8.1".
# Note the extra `/` after the protocol is required for the shorthand
# notation.
# terraform {
#   source = "tfr:///terraform-aws-modules/vpc/aws?version=5.8.1"
# }

# stage/terragrunt.hcl

locals {
  basename    = basename(get_original_terragrunt_dir())
  module_name = join("_", slice(split("_", local.basename), 0, 1))
  default_tags = {
    Project    = "Feedback App"
    ManagedBy  = "Terraform"
    stack_name = local.module_name
  }
}
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "feedback-app-terraform"
    key    = "${path_relative_to_include()}/terraform.tfstate"

    region  = "eu-central-1"
    encrypt = true
  }
}

# Indicate what region to deploy the resources into
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = var.default_tags
  }
}
EOF
}

generate "global_var" {
  path      = "global_var.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
variable "default_tags" {
  type    = map
  }
EOF
}


inputs = {
  default_tags = local.default_tags
}

