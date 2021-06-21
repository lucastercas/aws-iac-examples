resource "aws_security_group" "master_lb_sg" {
  name        = "master_lb_sg"
  vpc_id      = data.aws_vpc.vpc.id
  description = "Control Plane Loadbalancers Security Group"
  ingress {
    description      = "Stats Access (public)"
    to_port          = 1936
    from_port        = 1936
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    description      = "All Outbound External Access"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name        = "k8s_master_lb_sg"
    Environment = "learning"
  }
}

resource "aws_security_group" "master_node_sg" {
  name   = "master_node_sg"
  vpc_id = data.aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = flatten([var.control_plane_ports, var.etcd_ports, var.cni_ports])
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "-1"
      cidr_blocks = [data.aws_vpc.vpc.cidr_block]
    }
  }
  egress {
    description = "Outbound access to all VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]

  }
  tags = {
    Name        = "k8s_master_node_sg"
    Environment = "learning"
  }
}

resource "aws_security_group" "worker_node_sg" {
  name   = "worker_node_sg"
  vpc_id = data.aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = flatten([var.worker_ports, var.cni_ports])
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "-1"
      cidr_blocks = [data.aws_vpc.vpc.cidr_block]
    }
  }
  egress {
    description = "Outbound access to all VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]

  }
  tags = {
    Name        = "k8s_worker_node_sg"
    Environment = "learning"
  }
}
