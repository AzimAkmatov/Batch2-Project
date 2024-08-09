# VPC
resource "aws_vpc" "project_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Project_VPC"
  }
}
### Metadata for AZ
data "aws_availability_zones" "available" {
  state = "available"
}

# Public Subnet 1
resource "aws_subnet" "public_sub_1" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.cidr_block_pub_sub_1
  map_public_ip_on_launch = true
  #This will attach subnet into us-east-2a
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "Public_1"
  }
}

# Public Subnet 2
resource "aws_subnet" "public_sub_2" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.cidr_block_pub_sub_2
  map_public_ip_on_launch = true
  #This will attach subnet into us-east-2b
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "Public_2"
  }
}

# Internet Gateway for Public Subnet 1
resource "aws_internet_gateway" "project_gw" {
  vpc_id = aws_vpc.project_vpc.id
  tags = {
    Name = "Project-gw"
  }
}

# Public Route Table for Public Subnet 1
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Public Route Table Association for Public Subnet 1
resource "aws_route_table_association" "pub_1" {
  subnet_id      = aws_subnet.public_sub_1.id
  route_table_id = aws_route_table.public_rt.id
}
# Public Route Table Association for Public Subnet 2
resource "aws_route_table_association" "pub_2" {
  subnet_id      = aws_subnet.public_sub_2.id
  route_table_id = aws_route_table.public_rt.id
}

# NAT Gateway for Public Subnet
resource "aws_eip" "nat_eip" {
  vpc = true
}
resource "aws_nat_gateway" "pub_nat" {
  subnet_id     = aws_subnet.public_sub_1.id
  allocation_id = aws_eip.nat_eip.id
  tags = {
    Name = "Pub NAT gw"
  }
}

# Private Subnet 1
resource "aws_subnet" "private_sub_1" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.cidr_block_priv_sub_1
  #This will attach subnet into us-east-2a
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "Private_1"
  }
}

# Private Subnet 2
resource "aws_subnet" "private_sub_2" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.cidr_block_priv_sub_2
  map_public_ip_on_launch = false
  #This will attach subnet into us-east-2a
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "Private_2"
  }
}

# Private Subnet 3
resource "aws_subnet" "db_sub_1" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.cidr_block_priv_sub_3
  #This will attach subnet into us-east-2a
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "Private_3"
  }
}

# Private Subnet 4
resource "aws_subnet" "db_sub_2" {
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.cidr_block_priv_sub_4
  map_public_ip_on_launch = false
  #This will attach subnet into us-east-2a
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "Private_4"
  }
}

# Private Route Table for Private Subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.project_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pub_nat.id
  }
  tags = {
    Name = "private-rt"
  }
}

# Private Route Table Association for Private Subnet
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_sub_1.id
  route_table_id = aws_route_table.private_rt.id
}



###Public Security group for ALB for API
resource "aws_security_group" "alb_sg" {
  vpc_id     = aws_vpc.project_vpc.id
  name        = "project-alb-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
### Security Groups
# API SG
resource "aws_security_group" "api_sg" {
  name        = "allow-alb"
  description = "Allows HTTP traffic from ALB"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
    description = "SSH on port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    description = "HTTP on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_nginx"
  }
}
###Private Security group for Private ALB for WEB
resource "aws_security_group" "priv_alb_sg" {
  vpc_id     = aws_vpc.project_vpc.id
  name        = "priv-alb-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.api_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
###Private Security group that listens only to API EC2 for WEB
resource "aws_security_group" "web_sg" {
  vpc_id     = aws_vpc.project_vpc.id
  name        = "web_sg"
  ingress {
    description = "SSH on port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.priv_alb_sg.id]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.priv_alb_sg.id]
  }
  ingress {
  from_port   = 3000
  to_port     = 3000
  protocol    = "tcp"
  security_groups = [aws_security_group.priv_alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

### Database security Group
resource "aws_security_group" "db_sg" {
  vpc_id     = aws_vpc.project_vpc.id
  name        = "db_sg"
  ingress {
    description = "Allows connection to DB"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
