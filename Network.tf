module "vpc" {
  source = "./modules/Network/VPC"

  cidr_block      = "10.0.0.0/16"
  vpc-name        = "aws-eks"
  additional_tags = local.tags
}

module "IGW" {
  source = "./modules/Network/IGW"

  vpc_id                = module.vpc.vpc_ids
  IGW_Public_route_name = "aws-eks-IGW"
  additional_tags       = local.tags

}

module "subnets" {
  source = "./modules/Network/Subnet"

  vpc_id          = module.vpc.vpc_ids
  subnets         = local.subnets
  additional_tags = local.tags
}



module "Elastic-ip" {
  source = "./modules/Network/Elastic_IP"

  domain          = "vpc"
  additional_tags = local.tags
}

module "NAT" {
  source = "./modules/Network/NAT"

  elastic_ip_nat    = module.Elastic-ip.nat_gateway_ids
  subnet_id         = module.subnets.subnet_ids["public-2b"]
  additional_tags   = local.tags
  availability_zone = local.subnets.public-2.zone
}


module "Route" {
  source              = "./modules/Network/RoutTable"
  vpc_id              = module.vpc.vpc_ids
  internet_gateway_id = module.IGW.internet_gateway_ids
  nat_gateway_id      = module.NAT.privateNat_ids
  additional_tags     = local.tags
  subnets             = local.subnets
}
