variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-03ededff12e34e59e"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "MyEC2"
  }
  user_data = "$file('bootstrap.sh')"
}

