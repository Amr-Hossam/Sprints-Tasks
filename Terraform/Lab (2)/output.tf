output "web_instance_ip" {
    value = aws_instance.apache.public_ip
}