# Create a VPC
resource "aws_vpc" "dev" {
  cidr_block = var.cidr_block

  tags = {
    Name = "terraform-sprints"
  }  
}