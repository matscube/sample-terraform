variable "region" {
  default = "us-east-1"
}

variable "site_domain" {
  type = string
  description = "like www.example.com"
}

variable "root_domain" {
  type = string
  description = "like example.com"
}

variable "bucket_name" {
  type = string
  description = "recommend the same name as site_domain"
}

# Option, if arn is already created
variable "acm_certificate_arn" {
  type = string
  description = ""
}
# Option, if route53 zone is already created
variable "route53_zone_id" {
  type = string
  description = ""
}

# todo: use map
# variable "basic_auth_credentials" {
#   type        = map
#   description = "Credentials for Basic Authentication. Pass a map composed of 'user' and 'password'."
# }
variable "basic_auth_user" {
  type = string
  description = "(Optional) set username if you use basic-auth"
}
variable "basic_auth_password" {
  type = string
  description = "(Optional) set password for user if you use basic-auth"
}
variable "lambda_function_basic_auth_name" {
  type        = string
  description = "Lambda function name"
}
