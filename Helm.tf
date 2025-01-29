module "Helm_ALB" {
  source = "./modules/helm/aws_lb"
  aws_Loadbalancer_controller_name = "aws-load-balancer-controller"
  cluster_name                     = module.cluster.cluster-name
  aws_lb_iam_role_arn              = module.alb_controller_role.aws_alb_role_arn
  vpcId = module.vpc.vpc_ids

  depends_on = [module.node, module.alb_controller_role]
}
