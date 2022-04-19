provider "aws" {
  region = var.region
}

resource "aws_instance" "ssm-ec2-example" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "MyEC2"
  }
  security_groups = [aws_security_group.sg_ssh.name]
  depends_on      = [aws_security_group.sg_ssh]
}
