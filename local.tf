locals {
  tags = {
    "CreatedBy"   = "Terraform",
    "DevelopedBy" = "Tharun"
    "Project"     = "aws-eks"
  }
  subnets = {
    "private-1" = {
      zone = "ap-south-1a"
      cidr = "10.0.0.0/19"
      tags = {
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/aws-eks"   = "owned"
      }
      subnet_name = "private-1a"
      map_public_ip_on_launch = false
    }
    "private-2" = {
      zone = "ap-south-1b"
      cidr = "10.0.32.0/19"
      tags = {
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/aws-eks"   = "owned"
      }
      subnet_name = "private-1b"
      map_public_ip_on_launch = false
    }
    "public-1" = {
      zone = "ap-south-1a"
      cidr = "10.0.64.0/19"
      tags = {
        "kubernetes.io/role/elb"        = "1"
        "kubernetes.io/cluster/aws-eks" = "owned"
      }
      subnet_name             = "public-1a"
      map_public_ip_on_launch = true
    }
    "public-2" = {
      zone = "ap-south-1b"
      cidr = "10.0.96.0/19"
      tags = {
        "kubernetes.io/role/elb"        = "1"
        "kubernetes.io/cluster/aws-eks" = "owned"
      }
      subnet_name             = "public-1b"
      map_public_ip_on_launch = true
    }
  }

  eks-version = 1.31
  eks-tags = {
    Name    = "aws-eks"
    Version = "1.31"
  }
}

