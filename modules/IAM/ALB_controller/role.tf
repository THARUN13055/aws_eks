# Create Identify Provider
resource "aws_iam_openid_connect_provider" "eks_oidc" {
  url = "https://oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_id}"

  client_id_list = ["sts.amazonaws.com"]
  # refrence https://stackoverflow.com/questions/64624411/terraform-external-data-source-eks-thumbprint-not-working-sometimes
  thumbprint_list = var.thumb_list
}


# Create the Policy

resource "aws_iam_policy" "aws_lbc" {
  name   = "AWSLoadBalancerControllerIAMPolicy"
  policy = file("./iam_policy.json")
}

# Create the Role 
resource "aws_iam_role" "aws_lbc_role" {
  name               = "aws-load-balancer-controller-role"
  assume_role_policy = data.aws_iam_policy_document.aws_lbc.json
}

# Attach the policy in the role
resource "aws_iam_role_policy_attachment" "aws_alb_policy_attach" {
  policy_arn = aws_iam_policy.aws_lbc.arn
  role       = aws_iam_role.aws_lbc_role.name
}


data "aws_iam_policy_document" "aws_lbc" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.eks_oidc.arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks_oidc.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-load-balancer-controller"]
    }
  }
}
