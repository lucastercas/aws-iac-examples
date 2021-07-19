variable "public_subnets" {
  default = ["public_1a"]
}
resource "aws_subnet" "public_subnets" {
  for_each                = toset(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 4, index(var.public_subnets, each.key)) # 10.0.0.0/20, 10.0.16.0/20, 10.0.32.0/20
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[index(var.public_subnets, each.key)] # To-Do: Each subnet should be in different zones
  tags = {
    Name        = each.value
    Environment = "iac_lab"
    Tier = "public"
  }
}

variable "private_subnets" {
  default = ["private_1a", "private_1b"]
}
resource "aws_subnet" "private_subnets" {
  for_each                = toset(var.private_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 4, index(var.private_subnets, each.key) + 3) # 10.0.48.0/20, 10.0.64.0/20, 10.0.80.0/20
  availability_zone       = data.aws_availability_zones.available.names[index(var.private_subnets, each.key)]
  map_public_ip_on_launch = false
  tags = {
    Name        = each.value
    Environment = "iac_lab"
    Tier = "private"
  }
}

