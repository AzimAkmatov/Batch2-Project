# ###EC2 Public
# resource "aws_instance" "nginx-ec2" {
#     ami = var.ami_id
#     instance_type = var.instance_type
#     key_name = var.key_name
#     subnet_id = aws_subnet.public_sub.id
#     associate_public_ip_address = true
#     security_groups = [aws_security_group.allow_nginx.id]
#     user_data = file("userdata.sh")
#     tags = {
#         Name = "Test-ec2-instance"
#   }
# }

# resource "aws_instance" "private-ec2" {
#     ami = var.ami_id
#     instance_type = var.instance_type
#     key_name = var.key_name
#     subnet_id = aws_subnet.private_sub.id
#     security_groups = [aws_security_group.allow_nginx.id]
#     tags = {
#         Name = "Private Instance"
#   }
# }