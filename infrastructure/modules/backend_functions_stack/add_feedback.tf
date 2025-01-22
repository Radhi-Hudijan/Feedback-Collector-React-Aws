resource "aws_lambda_function" "add_feedback" {

  filename      = "add_feedback_function.zip"
  function_name = "add_feedback"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.mjs"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs18.x"
  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.cwd}/../../../../../../functions/add_feedback"
  output_path = "add_feedback_function.zip"
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "dynamodb_access" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.dynamodb_access.arn
}




