resource "aws_s3_bucket" "react_hosting" {
  bucket        = var.bucket_name
  force_destroy = true
}


# TODO: Add origin access control to allow cloudfront to access the bucket