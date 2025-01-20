resource "aws_iam_policy" "dynamodb_access" {
  name        = "dynamodb_access"
  description = "Allow access to dynamodb"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ],
        Resource = "*",
      },
    ],
  })
}


