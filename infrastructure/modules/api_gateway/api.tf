# Purpose: Create an API Gateway

# Create an API Gateway
resource "aws_apigatewayv2_api" "http_api" {
  name          = var.api_name
  protocol_type = "HTTP"

}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "$default"
  auto_deploy = true
}

# integration and route for the API Gateway
resource "aws_apigatewayv2_integration" "http_integration" {
  count              = var.functions != null ? length(var.functions) : 0
  description        = "HTTP integration"
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "AWS_PROXY"
  integration_method = var.functions[count.index].integration_method
  integration_uri    = var.functions[count.index].invoke_arn
}

resource "aws_apigatewayv2_route" "http_route" {
  count     = var.functions != null ? length(var.functions) : 0
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = var.functions[count.index].route_key
  target    = "integrations/${aws_apigatewayv2_integration.http_integration[count.index].id}"
}

# Lambda permission to invoke the API Gateway
resource "aws_lambda_permission" "invoke_lambda" {
  count         = var.functions != null ? length(var.functions) : 0
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.functions[count.index].lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"

}

# cognito authorizer for the API Gateway
resource "aws_apigatewayv2_authorizer" "cognito_authorizer" {
  api_id           = aws_apigatewayv2_api.http_api.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]
  name             = "cognito_authorizer"
  jwt_configuration {
    audience = [var.cognito_client_id]
    issuer   = var.cognito_issuer_url
  }

}
