resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket = var.s3_bucket_name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${var.s3_bucket_arn}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.feedback_app.arn
          }

        }
      }
    ]
  })

}
