provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "course_key" {
  key_name   = "course_key"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    Environment = "Learning"
    Name        = "course-ssh-key"
  }
}
