output "cluster-name" {
  value = aws_eks_cluster.aws_eks.name
}

# This is output for Helm provider

output "cluster_endpoint" {
  value = aws_eks_cluster.aws_eks.endpoint
}


output "cluster_ca_certificate" {
  value = aws_eks_cluster.aws_eks.certificate_authority[0].data
}

output "cluster_token" {
  value = data.aws_eks_cluster_auth.cluster_auth_name.token
}
