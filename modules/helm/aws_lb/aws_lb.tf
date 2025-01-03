resource "helm_release" "aws_Loadbalancer_controller" {
  name       = var.aws_Loadbalancer_controller_name
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.5.0"

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.name"
    value = var.aws_Loadbalancer_controller_name
  }
}
