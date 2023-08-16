output "dns_name" {
  value = aws_lb.nginx_load_balancer.dns_name
}

output "apache1-ip" {
    value = aws_instance.private-apache1.private_ip
}

output "apache2-ip" {
    value = aws_instance.private-apache2.private_ip
}