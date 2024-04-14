resource "aws_route_table" "ninja_app_1_rt_public" {
  vpc_id = aws_vpc.ninja_app_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ninja_app_1_igw.id
  }

  tags = {
    Name = "ninja_app_1-rt"
  }
}

resource "aws_route_table_association" "ninja_app_1_rta_public" {
  count          = length(aws_subnet.public_subnet.*.id)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.ninja_app_1_rt_public.id
}

resource "aws_route_table" "ninja_app_1_rt_private" {
  vpc_id = aws_vpc.ninja_app_1.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "ninja_app_1-rt"
  }
}

resource "aws_route_table_association" "ninja_app_1_rta_private" {
  count          = length(aws_subnet.private_subnet.*.id)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.ninja_app_1_rt_private.id
}
