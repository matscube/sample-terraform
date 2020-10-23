
resource "aws_batch_job_queue" "main" {
  name     = "${var.prefix}-job-queue"
  state    = "ENABLED"
  priority = 10
  compute_environments = [
    aws_batch_compute_environment.main.arn,
  ]

  depends_on = [aws_batch_compute_environment.main]
}
