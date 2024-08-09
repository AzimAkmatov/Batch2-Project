### Launch Template
resource "aws_launch_template" "priv_project_lt" {
    name = "private-project-lt"
    block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 5
    }
  }
    image_id = var.ami_id
    instance_initiated_shutdown_behavior = "terminate"
    instance_type = var.instance_type
    key_name = var.key_name
    user_data = filebase64("./scripts/web.sh")
    network_interfaces {
        security_groups             = [var.web_sg]
  }
    tag_specifications {
        resource_type = "instance"
        tags = {
          Name = "Web-instances"
        }
  }
}

###Autoscaling Group
resource "aws_autoscaling_group" "web_asg" {
  name = "WEB Autoscaling"
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  vpc_zone_identifier = [var.priv_sub_1_id, var.priv_sub_2_id]

  launch_template {
    id      = aws_launch_template.priv_project_lt.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.priv_project_tg.arn]
}