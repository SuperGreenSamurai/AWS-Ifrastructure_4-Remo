resource "aws_internet_gateway" "ninja_app_1_igw" {
  vpc_id = aws_vpc.ninja_app_1.id

  tags = {
    Name = "ninja_app_1_igw"
  }
}
