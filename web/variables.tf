variable "priv_sub_1_id" {
  type = string
  description = "This is output of pub_sub_1"
}
variable "priv_sub_2_id" {
  type = string
  description = "This is output of pub_sub_2"
}

variable "priv_alb_sg" {
  type = string
  description = "This is ALB security group"
}
variable "web_sg" {
  type = string
  description = "This is API public security group"
}
variable "vpc_id" {
  type = string
  description = "This is VPC ID"
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
    default = "project"
}