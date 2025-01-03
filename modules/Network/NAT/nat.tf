resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = var.elastic_ip_nat
  subnet_id     = var.subnet_id

  tags = merge({
    Name = "Private_NAT"
    zone = var.availability_zone
    },
    var.additional_tags
  )
}
