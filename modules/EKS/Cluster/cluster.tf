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
    public_access_cidrs     = ["0.0.0.0/0"]
    security_group_ids      = var.security_group_id
  }
}

data "aws_eks_cluster_auth" "cluster_auth_name" {
  name = aws_eks_cluster.aws_eks.name
}

data "tls_certificate" "tls_thumb" {
  url = aws_eks_cluster.aws_eks.identity.0.oidc.0.issuer
}

# Add-ons for the EKS cluster
resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.aws_eks.name
  addon_name   = "coredns"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name  = aws_eks_cluster.aws_eks.name
  addon_name    = "kube-proxy"
  addon_version = "v1.30.6-eksbuild.3"
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name  = aws_eks_cluster.aws_eks.name
  addon_name    = "vpc-cni"
  addon_version = "v1.19.0-eksbuild.1"
}