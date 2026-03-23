variable "subnet_id" {}
variable "backend_sg" {}
variable "instance_profile" {}
variable "ami_id" {
    description = "passing values to ami_id"
    default = ""
    type = string
}
variable "instance_type" {
    description = "passing values to instance_type"
    default = ""
    type = string
}