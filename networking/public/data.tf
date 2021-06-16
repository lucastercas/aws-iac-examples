data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "lucasmtercas-course-terraform-state"
    key    = "stage/networking/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}