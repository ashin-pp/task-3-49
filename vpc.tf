module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"

  name = "task-3-49-vpc"
  cidr = var.vpc_cidr
  azs  = [var.az]

  public_subnets      = [var.public_subnet_cidr]
  public_subnet_names = ["task-3-49-public-subnet"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  map_public_ip_on_launch = true

  igw_tags = {
    Name = "task-3-49-igw"
  }
}
