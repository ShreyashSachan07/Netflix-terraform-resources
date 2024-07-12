variable "kubernetes_version" {
  default     = 1.27
  description = "kubernetes version"
}

variable "aws_region" {
  default = "ap-south-1"
  description = "aws region"
}

variable "ami_type" {
  default = "AL2_x86_64"
  description = "AMI Type"
  
}

variable "instance_types" {
  default = ["t3.medium"]
  description = "Instance type"
  
}

variable "min_size" {
  default = "2"
  description = "Minimume size of worker nodes"
}

variable "max_size" {
  default = "4"
  description = "Maximum size of worker nodes"
}

variable "desired_size" {
  default = "2"
  description = "Desired size of worker nodes"
  
}
