resource "aws_security_group" "master_lb_sg" {
  name        = "master_lb_sg"
  vpc_id      = data.aws_vpc.vpc.id
  description = "master Loadbalancers Security Group"
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
