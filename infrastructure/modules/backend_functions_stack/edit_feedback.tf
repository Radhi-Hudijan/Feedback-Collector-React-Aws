resource "aws_lambda_function" "edit_feedback" {

  filename      = "edit_feedback_function.zip"
  function_name = "edit_feedback"
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


data "archive_file" "edit_feedback" {
  type        = "zip"
  source_dir  = "${path.cwd}/../../../../../../functions/edit_feedback"
  output_path = "edit_feedback_function.zip"
}
