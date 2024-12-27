variable "cluster_name" {
  type = string
}

variable "node_group_name" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "capacity_type" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "instance_types" {
  type = list(string)
}

variable "desired_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "tags" {
  type = map(string)
}

variable "additional_tags" {
  type = map(string)
}
