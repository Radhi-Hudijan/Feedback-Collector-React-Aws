# api variables 

variable "api_name" {
    description = "The name of the API Gateway"
    type        = string
}

variable "integration_method" {
    description = "The method of the integration"
    type        = string
}

variable "invoke_arn" {
    description = "The URI of the integration"
    type        = string
}

variable "route_key" {
    description = "The route key of the API Gateway"
    type        = string
}

variable "lambda_function_name" {
    description = "The name of the Lambda function"
    type        = string
}


variable "cognito_client_id" {
    description = "The client ID of the Cognito user pool"
    type        = string
  
}

variable "cognito_issuer_url" {
    description = "The issuer URL of the Cognito user pool"
    type        = string
}

# End of snippet
