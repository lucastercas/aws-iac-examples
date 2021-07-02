output "public_ips-instances" {
  value = {
    loadbalancers = aws_instance.cp_lb.*.public_ip
    masters       = aws_instance.master.*.public_ip
    workers       = aws_instance.worker.*.public_ip
  }
  description = "Public IPs"
}

output "public_ips-spot_request" {
  value = {
    controlplane_lb = aws_spot_instance_request.controlplane_loadbalancer.*.public_ip
    master = aws_spot_instance_request.master.*.public_ip
    worker = aws_spot_instance_request.worker.*.public_ip
  }
}

