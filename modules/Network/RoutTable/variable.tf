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

variable "subnets" {
  type = map(object({
    zone        = string
    cidr        = string
    tags        = map(string)
    subnet_name = string
  }))
}