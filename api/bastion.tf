resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id              = var.pub_sub_1_id
  associate_public_ip_address = true
  security_groups        = [var.api_sg]
  key_name               = var.key_name
  tags = {
    Name = "bastion-host"
  }
}