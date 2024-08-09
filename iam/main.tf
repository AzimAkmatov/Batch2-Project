###This is admin policy
resource "aws_iam_policy" "admin" {
  name        = "group-policy"
  description = "Admin policy for my DevOps group"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
#This is the user
resource "aws_iam_user" "project-user" {
  name = "Project"
}
#This is group
resource "aws_iam_group" "devops" {
  name = "DevOps"
}
#This is members of the group
resource "aws_iam_group_membership" "team" {
  name = "devops-group-membership"
  users = [
    aws_iam_user.project-user.name
  ]
  group = aws_iam_group.devops.name
}
#This is policy attach to that user
resource "aws_iam_group_policy_attachment" "devops-group" {
  group       = aws_iam_group.devops.name
  policy_arn = aws_iam_policy.admin.arn
}