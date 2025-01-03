terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.80.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Helm provider

provider "helm" {
  kubernetes {
    host                   = module.cluster.cluster_endpoint
    cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
    token                  = module.cluster.cluster_token
  }
}
