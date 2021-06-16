terraform {
  backend "s3" {
    bucket         = "lucasmtercas-course-terraform-state"
    key            = "stage/networking/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "course_terraform_state_lock"
    encrypt        = true
  }
}