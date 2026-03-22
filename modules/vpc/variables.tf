variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "public_subnet" {
  default = ["10.0.0.0/24","10.0.1.0/24"]
}
variable "private_subnet" {
  default = ["10.0.2.0/24","10.0.3.0/24"]
}
variable "availability_zone" {
    default = ["ap-south-2a","ap-south-2b"]
  
}