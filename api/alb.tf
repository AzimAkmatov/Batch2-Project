# ### ALB
# resource "aws_lb" "test_alb" {
#   name        = "test-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb_sg.id]
#   subnets            = [var.public_subnet_a, var.public_subnet_b]
#   enable_deletion_protection = false
#   tags = local.tags
# }
# ###Target Group
# resource "aws_lb_target_group" "test_tg" {
#   name        = "test-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = var.my_vpc
#   tags = local.tags
# }

# ### LB listener
# resource "aws_lb_listener" "test_listener" {
#   load_balancer_arn = aws_lb.test_alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.test_tg.arn
#   }
#   tags = local.tags
# }
# ###Public Security group
# resource "aws_security_group" "alb_sg" {
#   vpc_id = var.my_vpc
#   name        = "test_alb_sg"
#   ingress {
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
# }
# ###Private Security group that listens only to ALB
# resource "aws_security_group" "ec2_sg" {
#   vpc_id = var.my_vpc
#   name        = "test_ec2_sg"
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     security_groups = [aws_security_group.alb_sg.id]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
