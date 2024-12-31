resource "aws_eks_cluster" "aws_eks" {
  name = var.cluster-name

  access_config {
    authentication_mode                         = var.auth_mode
    bootstrap_cluster_creator_admin_permissions = true
  }

  role_arn = var.master-role-arn
  version  = var.eks-version

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    subnet_ids              = var.subnet_ids
    vpc_id                  = var.vpc_id

  }
}

data "aws_eks_cluster_auth" "cluster_auth_name" {
  name = aws_eks_cluster.aws_eks.name
}
