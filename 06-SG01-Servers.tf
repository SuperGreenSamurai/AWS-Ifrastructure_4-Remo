resource "aws_security_group" "ninja_app_1-sg01-servers" {
  name        = "ninja_app_1-sg01-servers"
  description = "ninja_app_1-sg01-servers"
  vpc_id      = aws_vpc.ninja_app_1.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "ninja_app_1-sg01-servers"
    Service = "ninja_app_1"
    Owner   = "Christo"
    Planet  = "Illini"
  }

}