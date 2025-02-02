variable "alb_role_name" {
  type = string
}

variable "alb_policy_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
}

variable "eks_cluster_id" {
  type = string
}

variable "thumb_list" {
  type = list(string)
}
