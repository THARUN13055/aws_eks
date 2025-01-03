# resource "aws_subnet" "eks-subnet" {
#   for_each = { for idx, subnet in var.subnet : subnet.name => subnet }
#   vpc_id                  = var.vpc_id
#   cidr_block              = var.cidr_block
#   availability_zone       = var.availability_zone
#   map_public_ip_on_launch = var.map_public_ip_on_launch

#   tags = merge(each.value.tags, var.additional_tags)
# }

resource "aws_subnet" "eks_subnet" {
  for_each = var.subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  tags = merge(each.value.tags, var.additional_tags)
}
