include "root" {
    path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/cognito"
}

inputs = {
    user_pool_name = "feedback-app-user-pool"
    client_name = "feedback-app-client"
    callback_urls = ["http://localhost:3000"]   
}