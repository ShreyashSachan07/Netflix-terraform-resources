
variable "vpc_cidr" {
  default     = ""
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = ""
  description = "aws region"
}

variable "private_subnets" {
  default = ""
  description = "Private Subnets CIDR range"
}

variable "public_subnets" {
  default = ""
  description = "Public Subnets CIDR range"
}