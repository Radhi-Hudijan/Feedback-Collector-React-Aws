
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules/api_gateway"

}

dependency "create_feedback_function" {
  config_path = "../../backend_functions"
    mock_outputs = {
        lambda_function_name = "add_feedback"
        lambda_function_invoke_arn = "arn:aws:lambda:eu-central-1:123456789012:function:add_feedback"
    }
}

dependency "cognito" {
  config_path = "../../cognito"
    mock_outputs = {
        cognito_client_id = "8ckehg57gg5ae60m1b2s70igc"
        cognito_issuer_url = "https://cognito-idp.eu-central-1.amazonaws.com/eu-central-1_AZ0E6IBOe"
    }
}


inputs = {
  api_name = "feedback-api"
  integration_method = "POST"
  invoke_arn = dependency.create_feedback_function.outputs.lambda_function_invoke_arn
  route_key = "CREATE /feedback" 
  lambda_function_name = dependency.create_feedback_function.outputs.lambda_function_name
  cognito_client_id = dependency.cognito.outputs.cognito_client_id
  cognito_issuer_url = dependency.cognito.outputs.cognito_issuer_url
}