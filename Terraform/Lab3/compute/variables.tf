variable "vpc_id" {
  type        = string
  description = "network vpc_id"
}

variable "nginx1_public_subnet_id" {
  type        = string
  description = "Public subnet id"
}
variable "nginx2_public_subnet_id" {
  type        = string
  description = "Public subnet id"
}
variable "apache1_private_subnet_id" {
  type        = string
  description = "Private subnet id"
}
variable "apache2_private_subnet_id" {
  type        = string
  description = "Private subnet id"
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

variable "availability_zone_1a" {
  type        = string
  description = "availability_zone_AWS us-east-1a"
}

variable "availability_zone_1b" {
  type        = string
  description = "availability_zone_AWS us-east-1b"
}



