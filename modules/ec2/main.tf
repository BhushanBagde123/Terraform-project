resource "aws_instance" "backend" {
  ami           = "ami-xxxx"
  instance_type = "t2.micro"
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.instance_profile

  associate_public_ip_address = false

  vpc_security_group_ids = [var.backend_sg]
}