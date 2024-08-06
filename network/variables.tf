variable "cidr_block" {
    type = string
    description = "This is number of IP addresses"
    default = "10.0.0.0/24"
}

variable "cidr_block_priv_sub" {
    type = string
    description = "This is number of IP addresses"
    default = "10.0.0.0/25"
}

variable "cidr_block_pub_sub" {
    type = string
    description = "This is number of IP addresses"
    default = "10.0.0.128/25"
}
variable "my_vpc" {
    type = string
    description = "This is my default VPC ID"
    default = "vpc-0f08943fd90e7dbf3"
}

# variable "public_subnet_a" {
#   description = "A list of public subnets to associate with"
#   default = "subnet-0619ea4bb7ebb897e"
# }
# variable "public_subnet_b" {
#   description = "A list of public subnets to associate with"
#   default = "subnet-0a97f94059721eeb0"
# }