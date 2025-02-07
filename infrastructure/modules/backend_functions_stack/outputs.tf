# lambda function outputs

output "create_feedback_function" {
  value = { name = aws_lambda_function.add_feedback.function_name, invoke_arn = aws_lambda_function.add_feedback.invoke_arn }
}

output "get_feedback_function" {
  value = { name = aws_lambda_function.get_feedback.function_name, invoke_arn = aws_lambda_function.get_feedback.invoke_arn }
}



