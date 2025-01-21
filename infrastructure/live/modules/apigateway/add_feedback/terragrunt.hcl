
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/api_gateway"
}

dependency "create_feedback_function" {
  config_path = "../../backend_functions"
    mock_outputs = {
        lambda_function_name = "add_feedback"
        invoke_url = "https://api.execute-api.eu-central-1.amazonaws.com/add_feedback"
    }
}


inputs = {
  api_name = "feedback-api"
  integration_method = "POST"
  invoke_arn = dependency.create_feedback_function.outputs.lambda_function_invoke_arn
  route_key = "CREATE /feedback" 
  lambda_function_name = dependency.create_feedback_function.outputs.lambda_function_name
}