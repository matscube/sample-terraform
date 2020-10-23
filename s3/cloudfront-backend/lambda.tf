module "basic_auth" {
  source = "github.com/builtinnya/aws-lambda-edge-basic-auth-terraform/module"

  basic_auth_credentials = {
    user     = var.basic_auth_user
    password = var.basic_auth_password
  }
  function_name = var.lambda_function_basic_auth_name
}
