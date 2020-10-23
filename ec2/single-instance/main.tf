terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "example" {
  ami = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = vpc.subnet_id
}
