module "vpc"{
    source = "./modules/vpc"
}
module "sg" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
  
}
module "bucket" {
    source = "./modules/s3bucket"
  
}
module "rds"{
    source = "./modules/rds"
    subnet = module.vpc.private_subnet
    RDS-sg = module.sg.RDS_SG
    user_name = var.user_name
    password = var.password  
}
module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet
  alb_sg = module.sg.ALB_SG
}
module "iam_role" {
  source = "./modules/iam_role"
}

module "ec2"{
 source = "./modules/ec2"
 ami_id = var.ami_id
 instance_type = var.instance_type
 subnet_id = module.vpc.private_subnet[0]
 backend_sg = module.sg.backend_SG
 instance_profile = module.iam_role.instance_profile_name

}
