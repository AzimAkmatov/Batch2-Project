output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}
output "vpc_id" {
  value = aws_vpc.project_vpc.id
}
output "priv_sub_id" {
  value = aws_subnet.private_sub.id
}
output "pub_sub_id" {
  value = aws_subnet.public_sub.id
}