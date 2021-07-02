#resource "aws_route53_zone" "primary" {
#  name = "lucastercas.xyz"
#  tags = {
#    Name        = "lucastercas.xyz"
#    Environment = "iac_lab"
#  }
#}
#
#resource "aws_route53_record" "record_nat_gw_www" {
#  zone_id = aws_route53_zone.primary.id
#  name    = "www"
#  type    = "A"
#  ttl     = "300"
#  records = [
#    data.aws_eip.nat_gw_ip.public_ip
#  ]
#}
#
#resource "aws_route53_record" "record_nat_gw" {
#  zone_id = aws_route53_zone.primary.id
#  name    = ""
#  type    = "A"
#  ttl     = "300"
#  records = [
#    data.aws_eip.nat_gw_ip.public_ip
#  ]
#}
#
#data "aws_eip" "nat_gw_ip" {
#  tags = {
#    Name        = "nat_gw_ip"
#    Environment = "iac_lab"
#  }
#}
#
