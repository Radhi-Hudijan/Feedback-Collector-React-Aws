resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

resource "aws_iam_role" "github_actions" {
  name                  = "github-actions"
  force_detach_policies = true
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
            "token.actions.githubusercontent.com:sub" = "repo:Radhi-Hudijan/Feedback-Collector-React-Aws:*"
          }
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "this" {
  name       = "Policy Attachement"
  roles      = [aws_iam_role.github_actions.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

