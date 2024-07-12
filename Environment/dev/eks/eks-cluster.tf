provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "remote-state-terraform-resources"
    key = "eks/eks.tfstate"
    region = "ap-south-1"
  }
}

data "aws_caller_identity" "current" {}

data "terraform_remote_state" "vpc" {
  backend  = "s3"
  config   = {
    bucket = "remote-state-terraform-resources"
    key    = "vpc/vpc.tfstate"
    region = "ap-south-1"
  }
}

locals {
  cluster_name = "demo-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = data.terraform_remote_state.vpc.outputs.private_subnets

  enable_irsa = false

  tags = {
    cluster = "demo"
  }

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = var.ami_type #"AL2_x86_64"
    instance_types         = var.instance_types #["t3.medium"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {

    node_group = {
      min_size     = var.min_size #2
      max_size     = var.max_size #6
      desired_size = var.desired_size #2
    }
  }
}

#create access entries/..