module "cluster" {
  source = "./modules/EKS/Cluster"

  cluster-name            = "aws-eks-cluster"
  auth_mode               = "API"
  master-role-arn         = module.master-role.master-role-arn
  eks-version             = local.eks-version
  subnet_ids              = [module.subnets.subnet_ids["private-1a"], module.subnets.subnet_ids["private-2b"]]
  endpoint_public_access  = true
  endpoint_private_access = true
  vpc_id                  = module.vpc.vpc_ids
}

module "node" {
  source          = "./modules/EKS/Node"
  cluster_name    = module.cluster.cluster-name
  node_group_name = "aws-eks-node"
  instance_types  = ["t2.medium"]
  node_role_arn   = module.node-role.node-role-arn
  subnet_ids      = [module.subnets.subnet_ids["private-1a"], module.subnets.subnet_ids["private-2b"]]
  capacity_type   = "ON_DEMAND"
  desired_size    = 2
  max_size        = 5
  min_size        = 2
  tags            = local.eks-tags
  additional_tags = local.tags
  disk_size       = 30
}

