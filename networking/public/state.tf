terraform {
  backend "s3" {
    bucket         = "lucasmtercas-course-terraform-state"
    key            = "stage/networking/subnet_public/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "course_terraform_state_lock"
    encrypt        = true
  }
}