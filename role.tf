# resource "aws_iam_role" "class_role" {
#   name = "class_role"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "read_EC2_attachment" {
#   role = aws_iam_role.class_role.name
#   policy_arn = aws_iam_policy.read_EC2.arn
# }