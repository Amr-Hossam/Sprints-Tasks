resource "aws_subnet" "nginx1_public_subnet" {
  cidr_block = var.nginx1_public_subnet_cidr_block
  vpc_id     = aws_vpc.dev.id
  availability_zone = var.availability_zone_1a 

  tags = {
    Name = "nginx1_public_subnet-sprints"
  }
}
resource "aws_subnet" "nginx2_public_subnet" {
  cidr_block = var.nginx2_public_subnet_cidr_block
  vpc_id     = aws_vpc.dev.id
  availability_zone = var.availability_zone_1b

  tags = {
    Name = "nginx2_public_subnet-sprints"
  }
}

resource "aws_subnet" "apache1_private_subnet" {
  cidr_block = var.apache1_private_subnet_cidr_block
  vpc_id     = aws_vpc.dev.id
  availability_zone = var.availability_zone_1a

  tags = {
    Name = "apache1_private_subnet-sprints"
  }
}

resource "aws_subnet" "apache2_private_subnet" {
  cidr_block = var.apache2_private_subnet_cidr_block
  vpc_id     = aws_vpc.dev.id
  availability_zone = var.availability_zone_1b

  tags = {
    Name = "apache2_private_subnet-sprints"
  }
}