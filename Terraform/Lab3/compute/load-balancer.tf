resource "aws_lb" "nginx_load_balancer" {
  name = "nginx-load-balancer"
  internal = false
  subnets = [var.nginx1_public_subnet_id, var.nginx2_public_subnet_id]
  load_balancer_type = "application"
  security_groups = [ aws_security_group.sg.id ]

  # listener {
  #   instance_protocol = "http"
  #   instance_port = 80
  #   lb_port = 80
  #   lb_protocol = "http"
  # }

  tags = {
    Environment = "sprints-nginx-lb"
  }
}

resource "aws_lb" "apache_load_balancer" {
  name = "apache-load-balancer"
  subnets = [var.apache1_private_subnet_id, var.apache2_private_subnet_id]
  load_balancer_type = "application"
  internal = true
  security_groups = [ aws_security_group.sg.id ]

  # listener {
  #   instance_protocol = "http"
  #   instance_port = 80
  #   lb_port = 80
  #   lb_protocol = "http"
  # }
  tags = {
    Environment = "sprints-apache-lb"
  }
}