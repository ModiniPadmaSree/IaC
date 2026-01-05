terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider configuration
provider "aws" {
  region = "us-east-1"
}

# EC2 instance resource
resource "aws_instance" "ubuntu" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
  key_name      = "terraform-key"

  tags = {
    Name = "Terraform-EC2"
  }
}
