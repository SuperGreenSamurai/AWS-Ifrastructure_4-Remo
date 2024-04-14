resource "aws_vpc" "ninja_app_1" {
  cidr_block           = "10.44.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "ninja_app_1"
    Service = "ninja_app_1"
    Owner   = "Christo"
    Planet  = "Illini"
  }
}