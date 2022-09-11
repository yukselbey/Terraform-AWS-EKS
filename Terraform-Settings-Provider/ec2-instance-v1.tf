# Resoure: EC2
resource "aws_instance" "ec2_vm" {
    ami = "ami-0742b4e673072066f"
    instance_type = "t3.micro"
    user_data = file("${path.module}/app1-install.sh")
    tags = {
      "Name" = "EC2 POC"
    } 
}