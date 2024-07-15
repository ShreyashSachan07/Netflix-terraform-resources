variable "kubernetes_version" {
  default     = ""
  description = "kubernetes version"
}

variable "aws_region" {
  default = ""
  description = "aws region"
}

variable "ami_type" {
  default = ""
  description = "AMI Type"
  
}

variable "instance_types" {
  default = ""
  description = "Instance type"
  
}

variable "min_size" {
  default = ""
  description = "Minimume size of worker nodes"
}

variable "max_size" {
  default = ""
  description = "Maximum size of worker nodes"
}

variable "desired_size" {
  default = ""
  description = "Desired size of worker nodes"
  
}
