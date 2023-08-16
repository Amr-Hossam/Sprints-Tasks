module "network" {
  source = "./network"
  cidr_block = var.cidr_block
  nginx1_public_subnet_cidr_block    = var.nginx1_public_subnet_cidr_block
  nginx2_public_subnet_cidr_block    = var.nginx2_public_subnet_cidr_block
  apache1_private_subnet_cidr_block  = var.apache1_private_subnet_cidr_block
  apache2_private_subnet_cidr_block  = var.apache2_private_subnet_cidr_block
  availability_zone_1a               = var.availability_zone_1a
  availability_zone_1b               = var.availability_zone_1b
  rt_cidr_block                      = var.rt_cidr_block
  
}


