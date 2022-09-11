#####################################################################
# Block-1: Terraform Settings Block
terraform {
  required_version = "~>=0.14"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}
# Provider Block
provider "aws " {
    region = "us-east-1"
}
/*
AWS Credentials Profile (profile = "default") configured on our local 
desktop terminal $HOME/.aws/credentials

Verify AWS Credentials 
cat $HOME/.aws/credentials
*/
# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = "ami-0742b4e673072066f"
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}