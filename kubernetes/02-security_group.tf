resource "aws_security_group" "cp_lb_sg" {
  name        = "cp_lb_public"
  vpc_id      = aws_vpc.vpc.id
  description = "Control Plane Loadbalancers Security Group"
  tags = {
    Name        = "public_access_sg"
    Environment = "learning"
  }
}
