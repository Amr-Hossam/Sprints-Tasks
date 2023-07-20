variable "region" {
  type        = string
  description = "AWS region us-east-1a"
}

variable "cidr_block" {
  type        = string
  description = "VPC cidr"
}

variable "subnet_cidr_block" {
  type        = string
  description = "subnet_cidr_block"
}

variable "availability_zone" {
  type        = string
  description = "availability_zone_AWS us-east-1a"
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
  description = "description"
}


