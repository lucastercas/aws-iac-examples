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

resource "aws_instance" "public_ssh_bastion" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.course_key.key_name

  availability_zone = data.aws_availability_zones.available.names[0]
  subnet_id         = aws_subnet.public_1a.id
  vpc_security_group_ids = [
    aws_security_group.public_access.id
  ]

  # So the bastion can access other instances
  provisioner "file" {
    source      = "~/.ssh/id_rsa"
    destination = "/home/ubuntu/id_rsa"
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
    }
  }

  tags = {
    Environment = "Learning"
    Name        = "public-ssh-bastion-${count.index}"
  }
}

resource "aws_instance" "private_instance" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.course_key.key_name

  availability_zone = data.aws_availability_zones.available.names[0]
  subnet_id         = aws_subnet.private_1a.id
  vpc_security_group_ids = [
    aws_security_group.private_access.id
  ]

  tags = {
    Environment = "Learning"
    Name        = "private-${count.index}"
  }
}
