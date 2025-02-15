include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/cloudfront_stack"
}

dependency "s3" {
  config_path = "../s3_stack"
  mock_outputs = {
    s3_bucket_name = "feedback-app-hosting-bucket"
    s3_bucket_arn  = "arn:aws:s3:::feedback-app-hosting-bucket"
  }
}


inputs = {
  s3_bucket_name = dependency.s3.outputs.s3_bucket_name
  s3_bucket_arn  = dependency.s3.outputs.s3_bucket_arn
}