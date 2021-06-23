resource "aws_eip" "nat_gw_ip" {
  depends_on = [
    aws_internet_gateway.main_igw
  ]
}

resource "aws_nat_gateway" "nat_gw" {
  subnet_id     = aws_subnet.public_subnets["public_1a"].id
  allocation_id = aws_eip.nat_gw_ip.id
  depends_on = [
    aws_internet_gateway.main_igw
  ]
  tags = {
    Name        = "main-gw"
    Environment = "learning"
  }
}
