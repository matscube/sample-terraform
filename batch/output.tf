output "aws_batch_compute_environment_arn" {
  value = aws_batch_compute_environment.main.arn
}
output "aws_batch_compute_environment_status" {
  value = aws_batch_compute_environment.main.status
}
output "aws_batch_compute_environment_status_reason" {
  value = aws_batch_compute_environment.main.status_reason
}

output "aws_vpc_id" {
  value = aws_vpc.main.id
}
output "aws_vpc_arn" {
  value = aws_vpc.main.arn
}
output "aws_vpc_default_security_group_id" {
  value = aws_vpc.main.default_security_group_id
}
output "aws_subnet_id" {
  value = aws_subnet.main.id
}
output "aws_subnet_arn" {
  value = aws_subnet.main.arn
}
