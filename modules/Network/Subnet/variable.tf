variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = any
}

variable "additional_tags" {
  type = map(string)
}
