#Creating the Route Table

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
  tags = merge({
    Name = "aws-eks-public"
    },
    var.additional_tags
  )
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  tags = merge({
    Name = "aws-eks-private"
    },
    var.additional_tags
  )
}

#Associated the Route Table

resource "aws_route_table_association" "public_route_table_association" {
  for_each       = { for id, subnet in var.subnets : id => subnet if lookup(subnet.tags, "kubernetes.io/role/elb", null) == "1" }
  subnet_id      = each.key
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_route_table_association" {
  for_each       = { for id, subnet in var.subnets : id => subnet if lookup(subnet.tags, "kubernetes.io/role/internal-elb", null) == "1" }
  subnet_id      = each.key
  route_table_id = aws_route_table.private.id
}
