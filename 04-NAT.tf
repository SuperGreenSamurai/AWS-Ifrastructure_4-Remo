/*
resource "aws_nat_gateway" "private_nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnet.id
}
*/

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = "aws_subnet.public_subnet.id"

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.ninja_app_1_igw]
}
