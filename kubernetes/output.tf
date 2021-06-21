output "cp_lb_ips" {
  value       = aws_instance.cp_lb.*.public_ip
  description = "Control Plane Loadbalancers IPs"
}
