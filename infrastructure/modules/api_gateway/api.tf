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
    description = "HTTP integration"
    api_id             = aws_apigatewayv2_api.http_api.id
    integration_type   = "AWS_PROXYY"
    integration_method = var.integration_method
    integration_uri    = var.integration_uri
}

resource "aws_apigatewayv2_route" "http_route" {
    api_id    = aws_apigatewayv2_api.http_api.id
    route_key = var.route_key
    target    = "integrations/${aws_apigatewayv2_integration.http_integration.id}"
}

# Lambda permission to invoke the API Gateway
resource "aws_lambda_permission" "invoke_lambda" {
    statement_id  = "AllowAPIGatewayInvoke"
    action        = "lambda:InvokeFunction"
    function_name = var.lambda_function_name
    principal     = "apigateway.amazonaws.com"
    source_arn    = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
    
}
