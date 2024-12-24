resource "aws_vpc" "eks-vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  enable_dns_support   = true
  enable_dns_hostnames = true

   tags = merge(
    {
      Name = var.vpc-name
    },
    var.additional_tags
  )
}
