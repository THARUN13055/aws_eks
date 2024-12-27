output "subnet_ids" {
  value = aws_subnet.eks-subnet.*.id
}
