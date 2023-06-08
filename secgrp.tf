resource "aws_security_group" "terrasg" {
  vpc_id      = aws_vpc.terravpc.id
  name        = "terra-sg"
  description = "SSH and HTTP connection SG"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.MYIP]
  }

  tags = {
    Name = "allow-ssh-http"
  }
}