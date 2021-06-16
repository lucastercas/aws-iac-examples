provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "public_1a" {
  vpc_id                  = data.terraform_remote_state.vpc.outputs.id
  cidr_block              = cidrsubnet(data.terraform_remote_state.vpc.outputs.cidr_block, 4, 0) # 10.0.0.0/20
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name        = "public_1a"
    Environment = "Learning"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = data.terraform_remote_state.vpc.outputs.id
  cidr_block              = cidrsubnet(data.terraform_remote_state.vpc.outputs.cidr_block, 4, 1) # 10.0.16.0/20
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name        = "public_1b"
    Environment = "Learning"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id                  = data.terraform_remote_state.vpc.outputs.id
  cidr_block              = cidrsubnet(data.terraform_remote_state.vpc.outputs.cidr_block, 4, 2) # 10.0.32.0/20
  availability_zone       = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = true
  tags = {
    Name        = "public_1c"
    Environment = "Learning"
  }
}
