data "aws_iam_policy_document" "aws_lbc" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}


resource "aws_iam_role" "aws_lbc_role" {
  name               = var.alb_role_name
  assume_role_policy = data.aws_iam_policy_document.aws_lbc.json

}

# resource "aws_iam_policy" "aws_lbc" {
#   policy = file("./iam_policy.json")
#   name   = var.alb_policy_name
# }

resource "aws_iam_policy" "aws_lbc" {
  name = var.alb_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "elasticloadbalancing:*",
          "ec2:Describe*",
          "iam:PassRole",
          "autoscaling:*",
          "cloudwatch:*",
          "logs:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "aws_alb_polciy_attach" {
  policy_arn = aws_iam_policy.aws_lbc.arn
  role       = aws_iam_role.aws_lbc_role.name
}

resource "aws_eks_pod_identity_association" "aws_lbc" {
  cluster_name    = var.cluster_name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = aws_iam_role.aws_lbc_role.arn
  depends_on      = [aws_iam_role.aws_lbc_role]
}

resource "aws_eks_addon" "pod_identity" {
  cluster_name  = var.cluster_name
  addon_name    = "eks-pod-identity-agent"
  addon_version = "v1.3.4-eksbuild.1"
}