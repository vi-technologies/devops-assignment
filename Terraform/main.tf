terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

data "aws_region" "current" {}

provider "aws" {
  region                   = "eu-north-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "vi"
}


module "vpc_jf"{
source  				= "./modules/vpc"
	vpc_name			= "vi_assignment_jf"
	cidr				= "10.0.0.0/16"
	availability_zones	=	["${data.aws_region.current.name}a", "${data.aws_region.current.name}b", "${data.aws_region.current.name}c"]
	private_subnets	    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
	public_subnets		= ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
	nat_gw				= true
	vpn_gw				= true
}

module "eks_jf" {
  source                        	= "./modules/eks"
  name                  					= "vi_assignment_jf"
  vpc_id                        	= module.vpc_jf.vpc_id
  subnet_ids                    	= module.vpc_jf.public_subnets_id
  controlplane_subnet_ids      		= module.vpc_jf.private_subnets_id

  default_eks_managed_node_groups = ["t3.medium"]


  eks_managed_node_groups 				= {
		spot_group = {
			min_size       = 1
			max_size       = 5
			desired_size   = 1
			instance_types = ["t3.medium"]
			capacity_type  = "SPOT"
		},
		od_group = {
			min_size       = 2
			max_size       = 5
			desired_size   = 2
			instance_types = ["t3.medium"]
			capacity_type  = "ON_DEMAND"
		}
	}
}