resource "aws_subnet" "eks-subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

 tags = merge(var.tags, var.additional_tags)
 tags_all = var.additional_tags
}