variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "subnet-name" {
  type = string
}

variable "additional_tags" {
  type = map(any)
}

variable "availability_zone" {
  type = string
}

variable "map_public_ip_on_launch" {
  type    = string
  default = "false"
}

variable "tags" {
  type = map(string)
}
