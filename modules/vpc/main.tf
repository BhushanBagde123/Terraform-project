resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name="project-form"
  }
}
resource "aws_subnet" "public" {
    count = length(var.public_subnet)
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet[count.index]
    availability_zone = var.availability_zone[count.index]
    tags = {
      Name="public-subnet-${count.index}"
    }
  
}
resource "aws_subnet" "private" {
    count = length(var.private_subnet)
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.var.private_subnet[count.index]
    availability_zone = var.availability_zone[count.index]
    tags = {
      Name="private-subnet-${count.index}"
    }
  
}
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name="IGW"
  }
}
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name="publicRT"
  }

}
resource "aws_route" "internet_access" {
  route_table_id = aws_route_table.publicRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.IGW.id
}
resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name="privateRT"
  }

}
resource "aws_route_table_association" "public_access" {
count = length(aws_subnet.public)

  subnet_id      = var.aws_subnet.public[count.index].id
  route_table_id = aws_route_table.publicRT.id

}
