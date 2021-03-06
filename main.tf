terraform {
  required_version = ">= 0.12"
}

locals {
  vpc_id  = "vpc-0159b4c5552d3dc32"
  env = "<enter your name>"
}

# ----------------------------------------------------------------------
# PROVIDERS
# ----------------------------------------------------------------------

provider "aws" {
  region = "<input your region>"
}

# ----------------------------------------------------------------------
# RESOURCES
# ----------------------------------------------------------------------

# This uses the default VPC.  It WILL NOT delete it on destroy.

resource "aws_default_vpc" "default" { }

# CREATE THE SECURITY GROUP THAT'S APPLIED TO THE EC2 INSTANCE
resource "aws_security_group" "<yourname>_allow_http" {
  name = "terraform-workshop-${local.env}"

  # Inbound HTTP from anywhere
  ingress {
    from_port   = server_port
    to_port     = server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "${local.env}-workshop" {
  ami                    = "[choose your ami]"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  tags = {
    Name = "terraform-workshop-${local.env}"
  }
}
