### Ami Lookups ###
data "aws_ami" "debian" {
  most_recent = true
  filter {
    name   = "name"
    values = ["debian-jessie-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["379101102735"]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

### Remote States Lookups ###
data "aws_vpc" "vpc" {
  tags = {
    Name = "learning_vpc"
  }
}

data "aws_subnet" "public_1a" {
  vpc_id = data.aws_vpc.vpc.id
  tags = {
    Name = "public_1a"
  }
}

data "aws_security_group" "public_ssh_access" {
    filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  tags = {
    Environment = "learning"
    Name        = "public_ssh_access_sg"
  }
}
