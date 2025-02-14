
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/api_gateway"

}

dependency "functions" {
  config_path = "../backend_functions"
}

dependency "cognito" {
  config_path = "../cognito"
}

inputs = {
  api_name   = "feedback-api"
  functions = [
    {
      lambda_function_name = dependency.functions.outputs.functions.create_feedback_function.name
      invoke_arn           = dependency.functions.outputs.functions.create_feedback_function.invoke_arn
      integration_method   = "POST"
      route_key            = "POST /feedback"
    },
    {
      lambda_function_name = dependency.functions.outputs.functions.get_feedback_function.name
      invoke_arn           = dependency.functions.outputs.functions.get_feedback_function.invoke_arn
      integration_method   = "POST"
      route_key            = "GET /feedback"
    },
    {
      lambda_function_name = dependency.functions.outputs.functions.delete_feedback_function.name
      invoke_arn           = dependency.functions.outputs.functions.delete_feedback_function.invoke_arn
      integration_method   = "POST"
      route_key            = "DELETE /feedback"
    },
    {
      lambda_function_name = dependency.functions.outputs.functions.edit_feedback_function.name
      invoke_arn           = dependency.functions.outputs.functions.edit_feedback_function.invoke_arn
      integration_method   = "POST"
      route_key            = "PUT /feedback"
    }
    
  ]
  cognito_client_id    = dependency.cognito.outputs.cognito_client_id
  cognito_issuer_url   = dependency.cognito.outputs.cognito_issuer_url
}