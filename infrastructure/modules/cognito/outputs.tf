output "user_pool_id" {
  value       = aws_cognito_user_pool.feebackPool.id
  description = "value of the user pool id"
}

output "client_id" {
  value       = aws_cognito_user_pool_client.feedbackClient.id
  description = "value of the client id"
}

output "client_secret" {
  value       = aws_cognito_user_pool_client.feedbackClient.client_secret
  description = "value of the client secret"
}

output "user_pool_arn" {
  value       = aws_cognito_user_pool.feebackPool.arn
  description = "value of the user pool arn"
}
