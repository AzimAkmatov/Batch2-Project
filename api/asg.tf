### Launch Template
resource "aws_launch_template" "project_lt" {
    name = "project-lt"
    block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 5
    }
  }
    image_id = var.ami_id
    instance_initiated_shutdown_behavior = "terminate"
    instance_type = var.instance_type
    # key_name = var.key_name
    user_data = filebase64("./scripts/userdata.sh")
    network_interfaces {
        associate_public_ip_address = true
        security_groups             = [var.api_sg]
  }
    tag_specifications {
        resource_type = "instance"
        tags = {
          Name = "Api-instances"
        }
  }
}

###Autoscaling Group
resource "aws_autoscaling_group" "api_asg" {
  name = "API Autoscaling"
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  health_check_grace_period = 60
  health_check_type         = "ELB"
  force_delete              = true
  vpc_zone_identifier = [var.pub_sub_1_id, var.pub_sub_2_id]

  launch_template {
    id      = aws_launch_template.project_lt.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.project_tg.arn]
}