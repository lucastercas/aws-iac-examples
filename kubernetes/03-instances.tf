resource "aws_instance" "cp_lb" {
  count         = 0
  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu.id
  key_name      = var.key_name
  subnet_id = data.aws_subnet.public_1a.id
  vpc_security_group_ids = [
    data.aws_security_group.public_ssh_access.id,
    aws_security_group.controlplane_loadbalancer.id,
  ]
  tags = {
    Name        = "master-lb-${count.index}"
    Environment = "iac_lab"
  }
}

resource "aws_instance" "master" {
  count         = 0
  instance_type = "t2.medium"
  ami           = data.aws_ami.ubuntu.id
  key_name      = var.key_name
  subnet_id = data.aws_subnet.public_1a.id
  vpc_security_group_ids = [
    data.aws_security_group.public_ssh_access.id,
    aws_security_group.master_node_sg.id
  ]
  tags = {
    Name        = "master-${count.index}"
    Environment = "iac_lab"
  }
}

resource "aws_instance" "worker" {
  count         = 0
  instance_type = "t2.medium"
  ami           = data.aws_ami.ubuntu.id
  key_name      = var.key_name
  subnet_id = data.aws_subnet.public_1a.id
  vpc_security_group_ids = [
    data.aws_security_group.public_ssh_access.id,
    aws_security_group.worker_node_sg.id
  ]
  tags = {
    Name        = "worker-${count.index}"
    Environment = "iac_lab"
  }
}

resource "aws_instance" "etcd" {
  count         = 0
  instance_type = "t2.micro"
  ami           = data.aws_ami.ubuntu.id
  key_name      = var.key_name
  subnet_id = data.aws_subnet.public_1a.id
  vpc_security_group_ids = [
    data.aws_security_group.public_ssh_access.id,
  ]
  tags = {
    Name        = "etcd-${count.index}"
    Environment = "iac_lab"
  }
}
