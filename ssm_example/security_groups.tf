resource "aws_security_group" "sg_ssh" {
  name = "sample-ssh-using-terraform"

  # Incoming
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ssm.amazonaws.com",
          "iam.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "test_attach" {
  role       = aws_iam_role.test_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_ssm_activation" "foo" {
  name               = "test_ssm_activation"
  description        = "Test"
  iam_role           = aws_iam_role.test_role.id
  registration_limit = "1"
  depends_on         = [aws_iam_role_policy_attachment.test_attach]
}
