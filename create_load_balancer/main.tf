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

resource "aws_elb" "elb1" {
  name               = "elb1"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${aws_instance.ec2InstanceHTTP.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraform-elb"
  }


}
