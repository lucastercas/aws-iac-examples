# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.main_igw.id
#   }

#   tags = {
#     Name        = "course_public_rtb"
#     Environment = "Learning"
#   }
# }
# resource "aws_main_route_table_association" "a" {
#   vpc_id         = aws_vpc.main.id
#   route_table_id = aws_route_table.public.id
# }
