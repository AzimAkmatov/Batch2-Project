### ALB
resource "aws_lb" "priv_project_alb" {
  name        = "priv-project-alb"
  internal           = true
  load_balancer_type = "application"
  subnets            = [var.priv_sub_1_id, var.priv_sub_2_id]
  security_groups    = [var.priv_alb_sg]
  enable_deletion_protection = false
}

###Target Group
resource "aws_lb_target_group" "priv_project_tg" {
  name     = "priv-project-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

### LB listener
resource "aws_lb_listener" "priv_project_listener" {
  load_balancer_arn = aws_lb.priv_project_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.priv_project_tg.arn
  }
}

