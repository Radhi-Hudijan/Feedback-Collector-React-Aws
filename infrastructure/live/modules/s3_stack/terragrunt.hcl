include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/s3_stack"
}

inputs = {
  bucket_name = "feadback-app-hosting-bucket"

}
