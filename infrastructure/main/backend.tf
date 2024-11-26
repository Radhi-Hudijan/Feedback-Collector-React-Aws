terraform {
  backend "s3" {
    bucket  = "feedback-app-terraform"
    key     = "state/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}