variable "vpc_id" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "nat_gateway_id" {
  type = string
}

variable "additional_tags" {
  type = map(string)
}

variable "public_subnet_id" {
  type = list(string)
}

variable "private_subnet_id" {
  type = list(string)
}