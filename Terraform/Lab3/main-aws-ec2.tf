module "compute" {
  source                           = "./compute"
  vpc_id                           = module.network.vpc_id
  nginx1_public_subnet_id          = module.network.nginx1_public_subnet_id
  nginx2_public_subnet_id          = module.network.nginx2_public_subnet_id
  apache1_private_subnet_id        = module.network.apache1_private_subnet_id
  apache2_private_subnet_id        = module.network.apache2_private_subnet_id
  availability_zone_1a             = var.availability_zone_1a
  availability_zone_1b             = var.availability_zone_1b   
  instance_type                    = var.instance_type
  key_name                         = var.key_name  
  sg_cidr_block                    = var.sg_cidr_block
}
