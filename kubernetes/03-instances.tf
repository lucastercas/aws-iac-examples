resource "aws_instance" "cp_lb" {
  count         = 1
  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu.id

  subnet_id = aws_subnet.private_subnet.id
  vpc_security_group_ids = [
    aws_security_group.cp_lb_sg.id
  ]

  tags = {
    Name = "cp_lb-${count.index}"
  }
}
