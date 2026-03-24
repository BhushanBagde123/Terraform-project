resource "aws_db_subnet_group" "db_subnet" {
  name       = "my-db-subnet-group"
  subnet_ids = var.subnet
}
resource "aws_db_instance" "db" {
  allocated_storage = 20
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  username          = var.user_name
  password          = var.password
 
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [var.RDS-sg]

  skip_final_snapshot = true
}