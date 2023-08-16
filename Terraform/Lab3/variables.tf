variable "region" {
  type        = string
  description = "AWS region us-east-1a"
}

variable "cidr_block" {
  type        = string
  description = "VPC cidr"
}

variable "nginx1_public_subnet_cidr_block" {
  type        = string
  description = "Public subnet cidr"
}
variable "nginx2_public_subnet_cidr_block" {
  type        = string
  description = "Public subnet cidr"
}
variable "apache1_private_subnet_cidr_block" {
  type        = string
  description = "Private subnet cidr"
}
variable "apache2_private_subnet_cidr_block" {
  type        = string
  description = "Private subnet cidr"
}


variable "availability_zone_1a" {
  type        = string
  description = "availability_zone_AWS us-east-1a"
}

variable "availability_zone_1b" {
  type        = string
  description = "availability_zone_AWS us-east-1b"
}

variable "rt_cidr_block" {
  type        = string
  description = "rt_cidr_block"
}

variable "sg_cidr_block" {
  type        = string
  description = "sg_cidr_block"
}

variable "instance_type" {
  type        = string
  description = "instance_type"
}

variable "key_name" {
  type        = string
  description = "my key name"
}




