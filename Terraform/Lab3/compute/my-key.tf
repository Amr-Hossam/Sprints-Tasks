# resource "tls_private_key" "pk" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "key_pair" {
#   key_name   = var.key_name     
#   public_key = tls_private_key.pk.public_key_openssh
# #   public_key = file("~/.ssh/id_rsa.pub")
  
#   provisioner "local-exec" { 
#     command = "echo '${tls_private_key.pk.public_key_pem}' > ~/.ssh/id_rsa"
#   }

#   provisioner "local-exec" { 
#     command = "chmod 600 ~/.ssh/id_rsa"
#   }
# }