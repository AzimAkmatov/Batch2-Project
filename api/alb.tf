### ALB
resource "aws_lb" "project_alb" {
  name        = "project-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [var.pub_sub_1_id, var.pub_sub_2_id]
  security_groups    = [var.alb_sg]
  enable_deletion_protection = false
}

###Target Group
resource "aws_lb_target_group" "project_tg" {
  name     = "project-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

### LB listener
resource "aws_lb_listener" "project_listener" {
  load_balancer_arn = aws_lb.project_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project_tg.arn
  }
}

