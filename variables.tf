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

variable "ami_id" {
    type = string
    description = "This is us-east-2 AMI ID"
    default = "ami-00db8dadb36c9815e"
}

variable "instance_type" {
    type = string
    description = "This is us-east-2 AMI ID"
    default = "t2.micro"
}

variable "key_name" {
    type = string
    description = "This is us-east-2 AMI ID"
    default = "test"
}

variable "my_vpc" {
    type = string
    description = "This is my default VPC ID"
    default = "vpc-0f08943fd90e7dbf3"
}

variable "public_subnet_a" {
  description = "A list of public subnets to associate with"
  default = "subnet-0619ea4bb7ebb897e"
}
variable "public_subnet_b" {
  description = "A list of public subnets to associate with"
  default = "subnet-0a97f94059721eeb0"
}