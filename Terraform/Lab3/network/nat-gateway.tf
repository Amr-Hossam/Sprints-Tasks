# resource "aws_eip" "my_eip" {
#   domain = "vpc"
# }

# resource "aws_nat_gateway" "my_nat_gateway" {
#   subnet_id = aws_subnet.nginx1_public_subnet.id
#   allocation_id = aws_eip.my_eip.id
# }