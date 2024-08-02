# #This is the user
# resource "aws_iam_user" "azim-user" {
#   name = "Azim"
# }
# #This is policy attach to that user
# resource "aws_iam_user_policy_attachment" "azim-user-attach" {
#   user       = aws_iam_user.azim-user.name
#   policy_arn = aws_iam_policy.admin.arn
# }
# #This is group
# resource "aws_iam_group" "devops" {
#   name = "DevOps"
# }
# #This is members of the group
# resource "aws_iam_group_membership" "team" {
#   name = "devops-group-membership"
#   users = [
#     aws_iam_user.azim-user.name
#   ]
#   group = aws_iam_group.devops.name
# }