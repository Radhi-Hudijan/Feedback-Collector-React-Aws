resource "aws_lambda_function" "get_feedback" {

  filename      = "get_feedback_lambda.zip"
  function_name = "get_feedback"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs18.x"
  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }
}

data "archive_file" "get_feedback" {
  type        = "zip"
  source_dir  = "${path.cwd}/../../../../../../functions/get_feedback"
  output_path = "get_feedback_lambda.zip"
}




