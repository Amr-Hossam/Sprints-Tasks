variable "cidr_block" {
  type        = string
  description = "VPC cidr"
}

variable "nginx1_public_subnet_cidr_block" {
  type        = string
  description = "Public subnet"
}

variable "nginx2_public_subnet_cidr_block" {
  type        = string
  description = "Public subnet"
}

variable "apache1_private_subnet_cidr_block" {
  type        = string
  description = "Private subnet"
}

variable "apache2_private_subnet_cidr_block" {
  type        = string
  description = "Private subnet"
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
