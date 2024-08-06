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