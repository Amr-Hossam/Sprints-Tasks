
output "nginx_dns" {
  value = module.compute.dns_name
}

output "apache1-ip" {
    value = module.compute.apache1-ip
}

output "apache2-ip" {
    value = module.compute.apache2-ip
}
