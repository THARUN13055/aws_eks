module "master-role" {
  source               = "./modules/IAM/Master_Role"
  eks-master-node-name = "aws-eks-master-role"
}


module "node-role" {
  source         = "./modules/IAM/Worker_Role"
  node-role-name = "aws-eks-node-role"
}
