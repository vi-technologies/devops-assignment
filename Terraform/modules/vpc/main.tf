module "aws_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.nat_gw
  enable_vpn_gateway = var.vpn_gw

  tags = {
    tf_managed = "true"
    environment = "vi-assignment"
  }
}
