# Project 11: Infrastructure change proposal
# Allow HTTP traffic to a web server

resource "aws_security_group" "webserver_sg" {
  name        = "project11-webserver-sg"
  description = "Allow HTTP traffic for web server"

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
