
output "cognito_client_id" {
    value = aws_cognito_user_pool.feedbackClient.id
}

output "cognito_issuer_url" {
    value = "https://cognito-idp.eu-central-1.amazonaws.com/${aws_cognito_user_pool.feebackPool.id}"
}