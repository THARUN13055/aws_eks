output "subnet_ids" {
  value = { for subnet in aws_subnet.eks_subnet : subnet.tags["Name"] => subnet.id }
}
