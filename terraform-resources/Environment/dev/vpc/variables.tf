
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = "ap-south-1"
  description = "aws region"
}

variable "private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "Private Subnets CIDR range"
}

variable "public_subnets" {
  default = ["10.0.4.0/24", "10.0.5.0/24"]
  description = "Public Subnets CIDR range"
}