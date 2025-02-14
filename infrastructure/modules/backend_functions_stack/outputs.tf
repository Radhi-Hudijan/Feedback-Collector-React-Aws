# lambda function outputs

output "functions" {
  value = {
    create_feedback_function = { name = aws_lambda_function.add_feedback.function_name, invoke_arn = aws_lambda_function.add_feedback.invoke_arn },
    get_feedback_function    = { name = aws_lambda_function.get_feedback.function_name, invoke_arn = aws_lambda_function.get_feedback.invoke_arn },
    delete_feedback_function = { name = aws_lambda_function.delete_feedback.function_name, invoke_arn = aws_lambda_function.delete_feedback.invoke_arn },
    edit_feedback_function   = { name = aws_lambda_function.edit_feedback.function_name, invoke_arn = aws_lambda_function.edit_feedback.invoke_arn }
  }
}

