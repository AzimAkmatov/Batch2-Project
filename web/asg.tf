# ### Launch Template
# resource "aws_launch_template" "class_lt" {
#     name = "test-lt"
#     block_device_mappings {
#     device_name = "/dev/sdf"
#     ebs {
#       volume_size = 5
#     }
#   }
#     image_id = var.ami_id
#     instance_initiated_shutdown_behavior = "terminate"
#     instance_type = var.instance_type
#     key_name = var.key_name
#     user_data = filebase64("userdata.sh")
#     network_interfaces {
#         associate_public_ip_address = true
#         security_groups             = [aws_security_group.ec2_sg.id]
#   }
#     tag_specifications {
#         resource_type = "instance"
#         tags = local.tags
#   }
# }
# ###Autoscaling Group
# resource "aws_autoscaling_group" "test_asg" {
#   desired_capacity   = 2
#   max_size           = 3
#   min_size           = 1
#   vpc_zone_identifier = [var.public_subnet_a, var.public_subnet_b]

#   launch_template {
#     id      = aws_launch_template.class_lt.id
#     version = "$Latest"
#   }
#   target_group_arns = [aws_lb_target_group.test_tg.arn]
# }