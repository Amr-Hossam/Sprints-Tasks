resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "my-public-rt"
  }
}

resource "aws_route_table_association" "nginx1_public-rt-association" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.nginx1_public_subnet.id

}

resource "aws_route_table_association" "nginx2_public-rt-association" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id = aws_subnet.nginx2_public_subnet.id
  
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.dev.id
  
  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
  tags = {
    Name = "my-private-rt"
  }
}

resource "aws_route_table_association" "apache1_private-association" {
  route_table_id = aws_route_table.private-rt.id
  subnet_id = aws_subnet.apache1_private_subnet.id
}

resource "aws_route_table_association" "apache2_private-rt-association" {
  route_table_id = aws_route_table.private-rt.id
  subnet_id = aws_subnet.apache2_private_subnet.id
  
}