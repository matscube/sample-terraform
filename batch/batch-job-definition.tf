
resource "aws_batch_job_definition" "main" {
  name = "${var.prefix}-job-definition"
  type = "container"

  # sample commands:
  # "command": ["ls", "-la"],
  # "command": ["/bin/sh", "-c", "wget www.google.com -O index.html && cat index.html"]
  container_properties = <<CONTAINER_PROPERTIES
{
    "command": ["/bin/sh", "-c", "wget www.google.com -O index.html && cat index.html"],
    "image": "busybox",
    "memory": 1024,
    "vcpus": 1,
    "volumes": [
      {
        "host": {
          "sourcePath": "/tmp"
        },
        "name": "tmp"
      }
    ],
    "environment": [
        {"name": "VARNAME", "value": "VARVAL"}
    ],
    "mountPoints": [
        {
          "sourceVolume": "tmp",
          "containerPath": "/tmp",
          "readOnly": false
        }
    ],
    "ulimits": [
      {
        "hardLimit": 1024,
        "name": "nofile",
        "softLimit": 1024
      }
    ]
}
CONTAINER_PROPERTIES
}
