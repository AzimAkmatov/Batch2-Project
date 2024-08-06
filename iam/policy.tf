# ###This is admin policy
# resource "aws_iam_policy" "admin" {
#   name        = "admin-azim-user"
#   description = "Admin policy for my user"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = [
#           "*",
#         ]
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })
# }
# ### This is the policy to READ only EC2

# resource "aws_iam_policy" "read_EC2" {
#   name        = "read_EC2"
#   description = "Only Read access to EC2"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = [
#           "ec2:Describe",
#         ]
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })
# }