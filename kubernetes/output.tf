output "public_ips" {
  value = {
    loadbalancers = aws_instance.cp_lb.*.public_ip
    masters       = aws_instance.master.*.public_ip
    workers       = aws_instance.worker.*.public_ip
  }
  description = "Public IPs"
}
