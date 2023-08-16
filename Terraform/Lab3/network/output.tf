output "vpc_id" {
    value = aws_vpc.dev.id
}

output "nginx1_public_subnet_id" {
    value = aws_subnet.nginx1_public_subnet.id
}

output "nginx2_public_subnet_id" {
    value = aws_subnet.nginx2_public_subnet.id
}

output "apache1_private_subnet_id" {
    value = aws_subnet.apache1_private_subnet.id
}

output "apache2_private_subnet_id" {
    value = aws_subnet.apache2_private_subnet.id
}