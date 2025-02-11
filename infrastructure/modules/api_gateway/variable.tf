# api variables 

variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "functions" {
  description = "The name of the lambda function"
  type        = list(map(string))
  default     = []
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
