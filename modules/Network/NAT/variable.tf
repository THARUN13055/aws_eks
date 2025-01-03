variable "elastic_ip_nat" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "additional_tags" {
  type = map(any)
}

variable "availability_zone" {
  type = string
}