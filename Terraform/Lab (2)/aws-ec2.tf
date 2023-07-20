resource "aws_security_group" "sg" {
  name        = "allow_ssh_http"
  description = "allow_ssh_http"
  vpc_id      = aws_vpc.dev.id

  ingress {
    description      = "HTTPs from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.sg_cidr_block]
  }
  ingress {
    description      = "HTTP from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [var.sg_cidr_block]
  }
  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.sg_cidr_block]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.sg_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = [var.sg_cidr_block]
  }

  tags = {
    Name = "allow-traffic"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "apache" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  associate_public_ip_address = true
  availability_zone = var.availability_zone
  key_name = var.key_name

  user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
EOF

  tags = {
    Name = "Apache"
   }
}

