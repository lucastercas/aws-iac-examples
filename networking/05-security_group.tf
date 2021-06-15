resource "aws_security_group" "public_access" {
  name        = "public_access"
  vpc_id      = aws_vpc.main.id
  description = "Public Access SG"

  ingress {
    description      = "SSH Access"
    to_port          = 22
    from_port        = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "All Outbound External Access"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "public_access_sg"
    Environment = "Learning"
  }
}


resource "aws_security_group" "private_access" {
  name        = "private access"
  vpc_id      = aws_vpc.main.id
  description = "Private Access SG"

  ingress {
    description = "SSH Access from public_acccess_sg"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [
      aws_security_group.public_access.id # Only accept requests from the public SG
    ]
  }

  egress {
    description      = "All Outbound External Access"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "private_access_sg"
    Environment = "Learning"
  }
}
