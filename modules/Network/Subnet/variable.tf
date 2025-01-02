# variable "vpc_id" {
#   type = string
# }

# variable "cidr_block" {
#   type = string
# }

# variable "additional_tags" {
#   type = map(any)
# }

# variable "availability_zone" {
#   type = string
# }

# variable "map_public_ip_on_launch" {
#   type    = bool
#   default = false
# }

# variable "subnet" {
#   type = list(object({
#     name = string
#     tags = map(string)
#   }))
# }

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = any
}

variable "additional_tags" {
  type = map(string)
}
