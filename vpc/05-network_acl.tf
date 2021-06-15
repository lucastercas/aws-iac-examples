resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "-1"
    action     = "allow"
    rule_no    = 100
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
  }

  ingress {
    protocol   = "-1"
    action     = "allow"
    rule_no    = 100
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name        = "main_network_acl"
    Environment = "Learning"
  }
}
