output "vpc" {
  value = {
    id         = aws_vpc.main.id,
    cidr_block = aws_vpc.main.cidr_block
  }
}

# output "subnets" {
#   value = {
#     public_1a = {
#       id = aws_subnet.public_1a.id
#     }
#     private_1a = {
#       id = aws_subnet.private_1a.id
#     }
#   }
# }

output "security_groups" {
  value = {
    public_ssh = {
      id = aws_security_group.public_ssh_access.id
    }
    private_ssh = {
      id = aws_security_group.private_ssh_access.id
    }
  }
}
