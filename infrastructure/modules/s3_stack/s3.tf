resource "aws_s3_bucket" "react_hosting" {
  bucket        = "feadback-app-hosting-bucket"
  force_destroy = true
}
