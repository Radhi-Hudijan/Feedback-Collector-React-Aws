resource "aws_cognito_user_pool" "feebackPool" {
  name = var.user_pool_name

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
  supported_identity_providers = [
    "COGNITO"
  ]

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows = [
    "code",
    "implicit"
  ]
  allowed_oauth_scopes = [
    "email",
    "openid",
  ]
  callback_urls = var.callback_urls



  generate_secret        = false
  refresh_token_validity = 1
  access_token_validity  = 1
  id_token_validity      = 1
}

