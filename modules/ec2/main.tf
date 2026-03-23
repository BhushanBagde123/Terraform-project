resource "aws_instance" "backend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.instance_profile
  
  associate_public_ip_address = false
  
  vpc_security_group_ids = [var.backend_sg]
}