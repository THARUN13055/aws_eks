resource "aws_eks_node_group" "aws-eks-node" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  capacity_type   = var.capacity_type
  disk_size       = var.disk_size
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  labels = {
    role = "general"
  }

  update_config {
    max_unavailable = 1
  }
  # Optional: Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
  tags = merge(var.tags, var.additional_tags)
}
