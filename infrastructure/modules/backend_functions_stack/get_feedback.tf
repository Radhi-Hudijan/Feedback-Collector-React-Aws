resource "aws_lambda_function" "get_feedback" {

  filename      = "lambda.zip"
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

resource "aws_iam_role" "iam_for_get_feedback_lambda" {
  name = "iam_for_get_feedback_lambda"
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

data "archive_file" "get_feedback" {
  type        = "zip"
  source_dir  = "${path.cwd}/../../../../../../functions/get_feedback"
  output_path = "lambda.zip"
}

resource "aws_iam_role_policy_attachment" "get_feedback_lambda_basic_execution" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "get_feedback_dynamodb_access" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.dynamodb_access.arn
}




