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

resource "aws_instance" "public-nginx1" {
  ami                          = data.aws_ami.ubuntu.id
  instance_type                = var.instance_type
  subnet_id                    = var.nginx1_public_subnet_id
  vpc_security_group_ids       = [ aws_security_group.sg.id ]
  associate_public_ip_address  = true
  availability_zone            = var.availability_zone_1a
  key_name                     = var.key_name
  # key_name                     = aws_key_pair.key_pair.key_name
  # user_data                    = var.public_nginx_user_data

  provisioner "remote-exec" {
    connection {
      type = "ssh"  
      host = self.public_ip
      user = "ubuntu"
      private_key = file("~/Terraform/my-key.pem")
      # private_key = aws_key_pair.key_pair.public_key

    }
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo touch /etc/nginx/sites-available/reverse-apache.conf",
      "sudo echo 'server {\nlisten 80;\nlocation / {\nproxy_pass http://${aws_lb.nginx_load_balancer.dns_name};\n}\n}' > /etc/nginx/sites-available/reverse-apache.conf",
      "sudo touch /etc/nginx/conf.d/lb.conf",
      "sudo cp /etc/nginx/sites-available/reverse-apache.conf  /etc/nginx/conf.d/lb.conf",
      "sudo ln -s /etc/nginx/sites-available/reverse-apache.conf /etc/nginx/sites-enabled/reverse-apache.conf",
      "sudo rm /etc/nginx/sites-enabled/default",
      "sudo ufw allow http/tcp",
      "sudo ufw enable",
      "sudo systemctl restart nginx"
      
    ]
  }
  tags = {
    Name = "public-nginx1"
   }
}

resource "aws_instance" "public-nginx2" {
  ami                          = data.aws_ami.ubuntu.id
  instance_type                = var.instance_type
  subnet_id                    = var.nginx2_public_subnet_id
  vpc_security_group_ids       = [ aws_security_group.sg.id ]
  associate_public_ip_address  = true
  availability_zone            = var.availability_zone_1b
  key_name                     = var.key_name
  # key_name                     = aws_key_pair.key_pair.key_name
  # user_data                    = var.public_nginx_user_data

  provisioner "remote-exec" {
    connection {
      type = "ssh"  
      host = self.public_ip
      user = "ubuntu"
      private_key = file("~/Terraform/my-key.pem")
  }
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo touch /etc/nginx/sites-available/reverse-apache.conf",
      "sudo echo 'server {\nlisten 80;\nlocation / {\nproxy_pass http://${aws_lb.nginx_load_balancer.dns_name};\n}\n}' > /etc/nginx/sites-available/reverse-apache.conf",
      "sudo touch /etc/nginx/conf.d/lb.conf",
      "sudo cp /etc/nginx/sites-available/reverse-apache.conf  /etc/nginx/conf.d/lb.conf",
      "sudo ln -s /etc/nginx/sites-available/reverse-apache.conf /etc/nginx/sites-enabled/reverse-apache.conf",
      "sudo rm /etc/nginx/sites-enabled/default",
      "sudo ufw allow http/tcp",
      "sudo ufw enable",
      "sudo systemctl restart nginx"
      
    ]
  }
  tags = {
    Name = "public-nginx2"
   }
}

resource "aws_instance" "private-apache1" {
  ami                          = data.aws_ami.ubuntu.id
  instance_type                = var.instance_type
  subnet_id                    = var.apache1_private_subnet_id
  vpc_security_group_ids       = [ aws_security_group.sg.id ]
  associate_public_ip_address  = false
  availability_zone            = var.availability_zone_1a
  key_name                     = var.key_name
  user_data                    = <<EOF
#!/bin/bash
sudo apt update 
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl strat apache2
sudo echo "<h1>Hello from $(ip addr show eth0 | grep -Po 'inet \K[\d.]+';) instance</h1>" > /var/www/html/index.html
EOF
  tags = {
    Name = "private-apache1"
   }
}

resource "aws_instance" "private-apache2" {
  ami                          = data.aws_ami.ubuntu.id
  instance_type                = var.instance_type
  subnet_id                    = var.apache2_private_subnet_id
  vpc_security_group_ids       = [ aws_security_group.sg.id ]
  associate_public_ip_address  = false
  availability_zone            = var.availability_zone_1b
  key_name                     = var.key_name
  user_data                    = <<EOF
#!/bin/bash
sudo apt update 
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl strat apache2
sudo echo "<h1>Hello from $(ip addr show eth0 | grep -Po 'inet \K[\d.]+';) instance</h1>" > /var/www/html/index.html
EOF

  tags = {
    Name = "private-apache2"
   }
}