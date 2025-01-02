locals {
  tags = {
    "CreatedBy"   = "Terraform",
    "DevelopedBy" = "Tharun"
    "Project"     = "aws-eks"
  }
  subnets = {
    "private-1a" = {
      zone = "ap-south-1a"
      cidr = "10.0.0.0/19"
      name = "private-1a"
      tags = {
        "Name"                            = "private-1a"
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/aws-eks"   = "owned"
      }
      map_public_ip_on_launch = false
    }
    "private-2b" = {
      zone = "ap-south-1b"
      cidr = "10.0.32.0/19"
      name = "private-2b"
      tags = {
        "Name"                            = "private-2b"
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/aws-eks"   = "owned"
      }
      map_public_ip_on_launch = false
    }
    "public-1a" = {
      zone = "ap-south-1a"
      cidr = "10.0.64.0/19"
      name = "public-1a"
      tags = {
        "Name"                          = "public-1a"
        "kubernetes.io/role/elb"        = "1"
        "kubernetes.io/cluster/aws-eks" = "owned"
      }
      map_public_ip_on_launch = true
    }
    "public-2b" = {
      zone = "ap-south-1b"
      cidr = "10.0.96.0/19"
      name = "public-2b"
      tags = {
        "Name"                          = "public-2b"
        "kubernetes.io/role/elb"        = "1"
        "kubernetes.io/cluster/aws-eks" = "owned"
      }
      map_public_ip_on_launch = true
    }
  }

  eks-version = 1.31
  eks-tags = {
    Name    = "aws-eks"
    Version = "1.31"
  }
}

