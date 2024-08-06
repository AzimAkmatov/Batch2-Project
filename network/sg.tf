# ### Security Group
# resource "aws_security_group" "allow_nginx" {
#   name        = "allow_nginx"
#   description = "Allows HTTP connection"
#   vpc_id      = "vpc-0f08943fd90e7dbf3"

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
# #   ingress {
# #     description = "HTTPS on port 443"
# #     from_port   = 443
# #     to_port     = 443
# #     protocol    = "tcp"
# #     cidr_blocks = ["0.0.0.0/0"]
# #   }
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