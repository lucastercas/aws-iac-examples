resource "aws_spot_instance_request" "controlplane_loadbalancer" {
  count = 1
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.medium"
  spot_price           = "0.05"
  key_name             = var.key_name
  wait_for_fulfillment = true
  subnet_id            = data.aws_subnet.public_1a.id
  vpc_security_group_ids = [
    data.aws_security_group.public_ssh_access.id,
    aws_security_group.controlplane_loadbalancer.id,
  ]
  tags = {
    Name = "k8s-controlplane-loadbalancer-${count.index}"
    Environment = "iac_lab"
  }
}

resource "aws_spot_instance_request" "master" {
  count = 2
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.medium"
  spot_price           = "0.05"
  key_name             = var.key_name
  wait_for_fulfillment = true
  subnet_id            = data.aws_subnet.public_1a.id
  vpc_security_group_ids = [
    data.aws_security_group.public_ssh_access.id,
    aws_security_group.master_node_sg.id,
  ]
  tags = {
    Name = "k8s-master-${count.index}"
    Environment = "iac_lab"
  }
}

resource "aws_spot_instance_request" "worker" {
  count = 2
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.medium"
  spot_price = "0.05"
  key_name      = var.key_name
  wait_for_fulfillment = true
  subnet_id = data.aws_subnet.public_1a.id
  vpc_security_group_ids = [
    data.aws_security_group.public_ssh_access.id,
    aws_security_group.worker_node_sg.id,
    aws_security_group.k8s_node_ports.id
  ]
  tags = {
    Name = "k8s-worker-${count.index}"
    Environment = "iac_lab"
  }
}
