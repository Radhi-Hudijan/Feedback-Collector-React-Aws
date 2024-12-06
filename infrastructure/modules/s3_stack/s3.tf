resource "aws_s3_bucket" "react_hosting" {
  bucket        = "feadback-app-hosting-bucket"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "react_hosting" {
  bucket = aws_s3_bucket.react_hosting.id
  acl    = "private"
}


# TODO: Add origin access control to allow cloudfront to access the bucket