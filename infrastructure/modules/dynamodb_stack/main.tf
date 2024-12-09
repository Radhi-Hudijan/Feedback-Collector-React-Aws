resource "aws_dynamodb_table" "feedback_table" {
  name         = "feedback"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "feedback_id"
  range_key    = "user_id"
  #   deletion_protection_enabled = true
  attribute {
    name = "feedback_id"
    type = "S"
  }
  attribute {
    name = "user_id"
    type = "S"
  }
}