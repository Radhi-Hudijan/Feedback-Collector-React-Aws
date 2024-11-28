data "external" "example" {
  program = ["bash", "${path.module}/generate_modules.sh"]
}
