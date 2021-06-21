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
