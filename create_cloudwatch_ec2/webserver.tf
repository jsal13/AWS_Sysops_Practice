provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2InstanceHTTP" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "MyWebserver"
  }
  user_data       = file("bootstrap.sh")
  security_groups = [aws_security_group.sg_ssh.name, aws_security_group.sg_http.name, aws_security_group.sg_https.name]

  depends_on = [aws_security_group.sg_ssh, aws_security_group.sg_http, aws_security_group.sg_https]
}

output "DNS" {
  value = aws_instance.ec2InstanceHTTP.public_dns
}
