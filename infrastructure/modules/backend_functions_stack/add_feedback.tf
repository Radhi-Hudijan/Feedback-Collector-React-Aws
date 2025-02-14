resource "aws_lambda_function" "add_feedback" {

  filename      = "add_feedback_function.zip"
  function_name = "add_feedback"
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


data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.cwd}/../../../../../../functions/add_feedback"
  output_path = "add_feedback_function.zip"
}





