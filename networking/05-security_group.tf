resource "aws_security_group" "public_ssh_access" {
  name        = "public_ssh_access"
  vpc_id      = aws_vpc.main.id
  description = "Public SSH Access SG"
  ingress {
    description      = "SSH Access"
    to_port          = 22
    from_port        = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    description      = "All Outbound SSH Access to All"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name        = "public_ssh_access_sg"
    Environment = "learning"
  }
}

resource "aws_security_group" "private_ssh_access" {
  name        = "private_ssh_access"
  vpc_id      = aws_vpc.main.id
  description = "Private SSH Access SG"
  ingress {
    description = "SSH Access from public_ssh_access_sg"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [
      aws_security_group.public_ssh_access.id # Only accept requests from the public SG
    ]
  }
  egress {
    description      = "All Outbound SSH Access to VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  tags = {
    Name        = "private_ssh_access_sg"
    Environment = "learning"
  }
}
