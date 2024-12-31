module "Helm_ALB" {
  source = "./modules/helm/aws_lb"

  aws_Loadbalancer_controller_name = "aws-load-balancer-controller"
  cluster_name                     = module.cluster.cluster-name

  depends_on = [module.node]
}
