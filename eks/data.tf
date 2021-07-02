data "aws_vpc" "vpc" {
	tags = {
		Name = "iac_lab_vpc"
	}
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.vpc.id
	tags = {
		Tier = "private"
	}
}
