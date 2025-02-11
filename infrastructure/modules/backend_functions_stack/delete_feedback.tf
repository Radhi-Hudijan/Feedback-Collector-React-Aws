resource "aws_lambda_function" "delete_feedback" {

  filename      = "delete_feedback_function.zip"
  function_name = "delete_feedback"
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

data "archive_file" "delete_feadback_lambda" {
  type        = "zip"
  source_dir  = "${path.cwd}/../../../../../../functions/delete_feedback"
  output_path = "delete_feedback_function.zip"
}
