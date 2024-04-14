resource "aws_security_group" "ninja_app_1_sg02_LB01" {
  name        = "ninja_app_1-sg02-LB01"
  description = "ninja_app_1-sg02-LB01"
  vpc_id      = aws_vpc.ninja_app_1.id

  ingress {  
    description = "MyHomePage"   #changed to port 80
    from_port   = 80
    to_port     = 80
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
    Name    = "ninja_app_1_sg02_LB01"
    Service = "ninja_app_1"
    Owner   = "Christo"
    Planet  = "Illini"
  }

}
