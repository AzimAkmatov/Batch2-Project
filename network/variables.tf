variable "vpc_cidr_block" {
    type = string
    description = "This is number of IP addresses"
    default = "10.0.0.0/23" #512 IP addresses
}

variable "cidr_block_priv_sub_1" {
    type = string
    description = "This is number of IP addresses"
    default = "10.0.0.0/25" #128 IP addresses
}
variable "cidr_block_priv_sub_2" {
    type = string
    description = "This is number of IP addresses"
    default = "10.0.0.128/25" #128 IP addresses
}

variable "cidr_block_pub_sub_1" {
    type = string
    description = "This is number of IP addresses"
    default = "10.0.1.0/25" #128 IP addresses
}
variable "cidr_block_pub_sub_2" {
    type = string
    description = "This is number of IP addresses"
    default = "10.0.1.128/25" #128 IP addresses
}
