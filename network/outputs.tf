output "vpc_id" {
  value = aws_vpc.project_vpc.id
}
output "priv_sub_1_id" {
  value = aws_subnet.private_sub_1.id
}
output "priv_sub_2_id" {
  value = aws_subnet.private_sub_2.id
}
output "pub_sub_1_id" {
  value = aws_subnet.public_sub_1.id
}
output "pub_sub_2_id" {
  value = aws_subnet.public_sub_2.id
}
output "alb_sg" {
  value = aws_security_group.alb_sg.id
}
output "api_sg" {
  value = aws_security_group.api_sg.id
}
output "web_sg" {
  value = aws_security_group.web_sg.id
}