#output "nat_gateway" {
#  value = {
#    "Public IP" = aws_eip.nat_gw_ip.public_ip
#    "Public DNS" = aws_eip.nat_gw_ip.public_dns
#    "Private IP" = aws_eip.nat_gw_ip.private_dns
#    "Private DNS" = aws_eip.nat_gw_ip.private_dns
#  }
#}

output "ssh_public_bastion" {
  value = {
    public_ip = aws_instance.public_ssh_bastion.*.public_ip
  }
}

