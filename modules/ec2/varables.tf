variable "subnet_id" {}
variable "backend_sg" {}
variable "instance_profile" {}
variable "ami_id" {
    description = "passing values to ami_id"
    type = string
}
variable "instance_type" {
    description = "passing values to instance_type"
    type = string
}