resource "aws_db_instance" "db" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = "db.t3.micro"
  identifier           = var.db_name
  username             = var.db_user
  password             = var.db_password
  vpc_security_group_ids = [var.db_sg]
  db_subnet_group_name = aws_db_subnet_group.main.name
  skip_final_snapshot = true
}


resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = var.db_subnets
}