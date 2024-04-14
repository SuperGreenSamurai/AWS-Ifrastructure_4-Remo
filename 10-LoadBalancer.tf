resource "aws_lb" "ninja_app_1_alb" {
  name               = "ninja-app-1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ninja_app_1_sg02_LB01.id]
  subnets            = ["aws_subnet.public_subnet"]

  enable_deletion_protection = false
  #Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "ninja_app_1_LoadBalancer"
    Service = "ninja_app_1"
    Owner   = "Christo"
    Planet  = "Illini"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.ninja_app_1_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ninja_app_1_tg.arn
  }
}
/*
data "aws_acm_certificate" "cert" {
  domain      = "ninjasdelacloud.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.ninja_app_1_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08" # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ninja_app_1_tg.arn
  }
}
*/