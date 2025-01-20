# api variables 

variable "api_name" {
    description = "The name of the API Gateway"
    type        = string
}

variable "integration_method" {
    description = "The method of the integration"
    type        = string
}

variable "integration_uri" {
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
# End of snippet
