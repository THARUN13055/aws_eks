variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "additional_tags" {
  type = map(any)
}


variable "vpc-name" {
  type = string
}