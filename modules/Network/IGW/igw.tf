resource "aws_internet_gateway" "IGW_Public_route" {
  vpc_id = var.vpc_id
  tags = merge({
    Name = var.IGW_Public_route_name
    },
    var.additional_tags
  )
}

#Internet Gateway Attachment

resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.IGW_Public_route.id
  vpc_id              = var.vpc_id
}
