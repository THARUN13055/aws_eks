resource "aws_eip" "nat_eip" {
  domain = var.domain
  tags = merge({
    Name = "NAT Gateway ap-south-1"
    },
    var.additional_tags
  )
}
