resource "aws_security_group" "public_ssh_access" {
  name        = "public_ssh_access"
  vpc_id      = aws_vpc.main.id
  description = "Public SSH Access SG"
  ingress {
    description    = "SSH Access"
    to_port          = 22
    from_port        = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    description      = "All Outbound External Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name        = "public_ssh_access_sg"
    Environment = "iac_lab"
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
    description      = "All Outbound External Access"
    from_port        = 22
    to_port          = 22
    protocol    = "tcp"
    security_groups = [
      aws_security_group.public_ssh_access.id # Only accept requests from the public SG
    ]
  }
  tags = {
    Name        = "private_ssh_access_sg"
    Environment = "iac_lab"
  }
}

resource "aws_security_group" "public_vpn_access" {
  name = "public_vpc_access"
  vpc_id      = aws_vpc.main.id
  description = "Public VPN Access"
  ingress {
    description = "Access to VPN from public"
    from_port = 41194
    to_port = 41194
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Access to VPN from public"
    from_port = 41194
    to_port = 41194
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "public_vpn_access"
    Environment = "iac_lab"
  }
}

