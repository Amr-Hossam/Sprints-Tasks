# Create a VPC
resource "aws_vpc" "dev" {
  cidr_block = var.cidr_block

  tags = {
    Name = "terraform-sprints"
  }  
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "terraform-subnet-sprints"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "my-gw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "my-rt"
  }
}

resource "aws_route_table_association" "rt-association" {
  route_table_id = aws_route_table.rt.id
  subnet_id = aws_subnet.subnet.id
}