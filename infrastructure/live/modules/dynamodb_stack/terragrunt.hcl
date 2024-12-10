include "root" {
  path = find_in_parent_folders()
}

terraform{
    source ="../../../modules/dynamodb_stack"
}

inputs = {
    table_name = "feedback_table"
}