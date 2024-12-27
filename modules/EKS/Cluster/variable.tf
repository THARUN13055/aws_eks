variable "cluster-name" {
  type = string
}

variable "auth_mode" {
  type    = string
  default = "API"
}

variable "master-role-arn" {
  type = string
}

variable "eks-version" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "endpoint_private_access" {
  type    = bool
  default = true
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "vpc_id" {
  type = string
}