resource "aws_cognito_user_pool" "feebackPool" {
  name = var.user_pool_name


  schema {
    name                     = var.schema_name
    attribute_data_type      = var.attribute_data_type
    required                 = true
    mutable                  = true
    developer_only_attribute = false
    string_attribute_constraints {
      min_length = 0
      max_length = 2048
    }
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
  }

  username_attributes = ["email"]
  username_configuration {
    case_sensitive = false
  }

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
}


// Resource for the user pool client
resource "aws_cognito_user_pool_client" "feedbackClient" {
  name         = var.client_name
  user_pool_id = aws_cognito_user_pool.feebackPool.id
  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]

}
