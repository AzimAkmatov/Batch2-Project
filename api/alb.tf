# ### ALB
# resource "aws_lb" "test_alb" {
#   name        = "test-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb_sg_id.id]
#   subnets            = [priv_sub_id, pub_sub_id]
#   enable_deletion_protection = false
# }
# ###Target Group
# resource "aws_lb_target_group" "test_tg" {
#   name        = "test-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = module.network.vpc_id
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
# }

