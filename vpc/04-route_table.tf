# Public
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name        = "course_public_rtb"
    Environment = "Learning"
  }
}
resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.public.id
}

# Private
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name        = "course_private_rtb"
    Environment = "Learning"
  }
}

resource "aws_route_table_association" "private_rtb-private_1a" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_1a.id
}

resource "aws_route_table_association" "private_rtb-private_1b" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_1b.id
}

resource "aws_route_table_association" "private_rtb-private_1c" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_1c.id
}
