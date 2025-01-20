include "root" {
    path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/backend_functions_stack"
}

inputs = {
   table_name = "feedback-table"
}