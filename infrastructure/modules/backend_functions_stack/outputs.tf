# lambda function outputs

output "lambda_function_name" {
    value = aws_lambda_function.add_feedback.function_name
}


output "lambda_function_invoke_arn" {
    value = aws_lambda_function.add_feedback.invoke_arn
}
