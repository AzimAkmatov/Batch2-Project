# # VPC
# resource "aws_vpc" "test_vpc" {
#   cidr_block           = var.cidr_block
#   enable_dns_support   = true
#   enable_dns_hostnames = true
#   tags = {
#     Name = "Test"
#   }
# }

# # Private Subnet
# resource "aws_subnet" "private_sub" {
#   vpc_id     = aws_vpc.test_vpc.id
#   cidr_block = var.cidr_block_priv_sub
#   map_public_ip_on_launch = false
#   tags = {
#     Name = "Private"
#   }
# }

# # Public Subnet
# resource "aws_subnet" "public_sub" {
#   vpc_id     = aws_vpc.test_vpc.id
#   cidr_block = var.cidr_block_pub_sub
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "Public"
#   }
# }

# # Internet Gateway
# resource "aws_internet_gateway" "test_gw" {
#   vpc_id = aws_vpc.test_vpc.id
#   tags = {
#     Name = "Test-gw"
#   }
# }

# # Public Route Table
# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.test_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.test_gw.id
#   }

#   tags = {
#     Name = "public-rt"
#   }
# }

# # Public Route Table Association
# resource "aws_route_table_association" "pub" {
#   subnet_id      = aws_subnet.public_sub.id
#   route_table_id = aws_route_table.public_rt.id
# }

# # NAT Gateway
# resource "aws_eip" "nat_eip" {
#   vpc = true
# }

# resource "aws_nat_gateway" "pub_nat" {
#   subnet_id     = aws_subnet.public_sub.id
#   allocation_id = aws_eip.nat_eip.id
#   tags = {
#     Name = "Pub NAT gw"
#   }
# }

# # Private Route Table
# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.test_vpc.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.pub_nat.id
#   }
#   tags = {
#     Name = "private-rt"
#   }
# }

# # Private Route Table Association
# resource "aws_route_table_association" "private" {
#   subnet_id      = aws_subnet.private_sub.id
#   route_table_id = aws_route_table.private_rt.id
# }

# # Security Group
# resource "aws_security_group" "allow_nginx" {
#   name        = "allow_nginx"
#   description = "Allows HTTP connection"
#   vpc_id      = aws_vpc.test_vpc.id

#   ingress {
#     description = "SSH on port 22"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "HTTP on port 80"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_nginx"
#   }
# }
