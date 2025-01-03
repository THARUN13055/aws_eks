module "master-role" {
  source               = "./modules/IAM/Master_Role"
  eks-master-node-name = "aws-eks-master-role"
}


module "node-role" {
  source         = "./modules/IAM/Worker_Role"
  node-role-name = "aws-eks-node-role"
}


module "alb_controller_role" {
  source          = "./modules/IAM/ALB_controller"
  alb_role_name   = "aws-eks-alb-role"
  alb_policy_name = "aws-eks-alb-policy"
  cluster_name    = module.cluster.cluster-name
}
