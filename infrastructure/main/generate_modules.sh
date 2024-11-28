#!/bin/bash

FOLDER_DIR="../modules"

# Output file where the Terraform code will be written
OUTPUT_FILE="./generated_modules.tf"

# Empty the output file if it exists, or create it
> "$OUTPUT_FILE"

# Check if the directory exists
if [ ! -d "$FOLDER_DIR" ]; then
  echo '{"error": "Modules directory not found"}'
  exit 1
fi


# Loop through each folder in the specified directory
for folder in "$FOLDER_DIR"/*; do
  if [ -d "$folder" ]; then
    folder_name=$(basename "$folder")
    
    cat <<EOF >> "$OUTPUT_FILE"
module "$folder_name" {
  source = "../modules/$folder_name"
}

EOF
fi
done
echo '{"Success": "Modules added"}'
