provider "aws" {
  region = var.region
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "MyWebserver"
  }
  user_data       = "$file('bootstrap.sh')"
  security_groups = [aws_security_group.sg_ssh.name, aws_security_group.sg_html.name]

  depends_on = [aws_security_group.sg_ssh, aws_security_group.sg_html]
}

