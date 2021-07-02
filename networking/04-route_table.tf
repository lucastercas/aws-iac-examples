resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
  tags = {
    Name        = "course_public_rtb"
    Environment = "iac_lab"
  }
}

resource "aws_main_route_table_association" "rtb_association" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.public.id
}

#resource "aws_route_table" "private" {
#  vpc_id = aws_vpc.main.id
#  route {
#    cidr_block     = "0.0.0.0/0"
#    nat_gateway_id = aws_nat_gateway.nat_gw.id
#  }
#  tags = {
#    Name        = "course_private_rtb"
#    Environment = "iac_lab"
#  }
#}

#resource "aws_route_table_association" "private_rtb-private_1a" {
#  route_table_id = aws_route_table.private.id
#  subnet_id      = aws_subnet.private_subnets["private_1a"].id
#}

# To-Do: Migrate to for_each
# resource "aws_route_table_association" "private_rtb-private_1b" {
#   route_table_id = aws_route_table.private.id
#   subnet_id      = aws_subnet.private_1b.id
# }

# resource "aws_route_table_association" "private_rtb-private_1c" {
#   route_table_id = aws_route_table.private.id
#   subnet_id      = aws_subnet.private_1c.id
# }
